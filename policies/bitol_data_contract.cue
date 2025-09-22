#Id:            string & =~"^[a-zA-Z0-9:._\\-]+$"
#ComponentId:   #Id & =~"^urn:dmb:cmp:[a-zA-Z0-9:._\\-]+:[a-zA-Z0-9_\\-]+:[a-zA-Z0-9:._\\-]+:[a-zA-Z0-9_\\-]+$"
#DataProduct:   string & =~"^system:[a-zA-Z0-9:._\\-]+\\.[a-zA-Z0-9_\\-]+\\.[a-zA-Z0-9:._\\-]+$"

#AuthoritativeDefinitions: {
        url!:   string
        type!:  string
}

#DataContractDescription: {
    purpose?:       string | null
    limitation?:    string | null
    usage?:         string | null
    authoritativeDefinitions?: [...#AuthoritativeDefinitions] | null
    ...
}

#DataContractGeneralInfo: {
    name!:              string
    description?:       string | null
    businessName?:      string | null
    authoritativeDefinitions?:   [...#AuthoritativeDefinitions] | null
    tags?:                       [...string]
    dataGranularityDescription?: string | null
    ...
}

#Quality: {
    name?:          string | null
    type!:          "text" | "sql" | "custom" | null
    description?:   string | null
    dimension?:     "accuracy" |"completeness" | "conformity" | "consistency" | "coverage" | "timeliness" | "uniqueness" | null
    severity?:      string | null
    businessImpact?: string | null
    tags?:          [...string] | null
    authoritativeDefinitions?: [...#AuthoritativeDefinitions] | null
    scheduler?:     string | null
    schedule?:      string | null

    if type == "sql" {
        query?:                     int | null
        mustBe?:                    int | null
        mustNotBe?:                 int | null
        mustBeBetween?:             [...int] | null
        mustNotBeBetween?:          [...int] | null
        mustBeGreaterThan?:         int | null
        mustBeGreaterOrEqualTo?:    int | null
        mustBeLessThan?:            int | null
        mustBeLessOrEqualTo?:       int | null
        ...
    }

    if type == "custom" {
        engine?:        "great expectations" | null
        implementation?: string | null
        ...
    }

    ...
}

#Properties: {
    #DataContractGeneralInfo
    primaryKey?:         bool | null
    primaryKeyPosition?: int | null
    requiredProperty?:   bool | null
    unique?:             bool | null
    classification?:     string | null
    encryptedName?:      string | null
    transformSourceObject?: [...string] | null
    examples?:              [...string] | null
    criticalDataElement?:   bool | null

    logicalType!:     *"" | "string" | "number" | "boolean" | "integer" | "date" | null

    if logicalType == "array" {
        logicalTypeOptions?: {
            maxItems?:      int | null
            minItems?:      int | null
            uniqueItems?:   bool | null
            items?:         [...#Properties]
        }
    }

    if logicalType == "date" {
        logicalTypeOptions?: {
            format?:    "yyyy-MM-dd" | "yyyy-MM-ddTHH:mm:ssZ" | "HH:mm:ss" | null
            minimum?:       string | null
            maximum?:       string | null
            exclusiveMinimum?: bool | null
            exclusiveMaximum?: bool | null
        }
    }

    if logicalType == "integer" || logicalType == "number" {
        logicalTypeOptions?: {
            format?:        "i8" | "i16" | "i32" | "i64" | "i128" | "isize" | "u8" | "u16" | "u32" | "u64" | "u128" | "usize" | null
            minimum?:       int | null
            maximum?:       int | null
            exclusiveMinimum?: bool | null
            exclusiveMaximum?: bool | null
            multipleOf?:    int | null
        }
    }

    if logicalType == "string" {
        logicalTypeOptions?: {
            format?:  "email" | "password" | "byte" | "binary" | "hostname" | "ipv4" | "ipv6" | "uri" | "uuid" | null
            pattern?: string | null
            maxLength?:     int | null
            minLength?:     int | null
        }
    }

    quality?:            [...#Quality] | null
    ...
}

#Schema: {
    #DataContractGeneralInfo
    logicalType?:   "object"
    properties?:    [...#Properties] | null
    maxProperties?: int | null
    minProperties?: int | null
    required?:      [...string]
    quality?:       [...#Quality] | null
    ...
}

#Support: {
    channel!:       string
    url!:           string
    description?:   string | null
    scope?:         "interactive" | "announcements" | "issues" | null
    invitationUrl?: string | null
    tools?:         string
    ...
}

#Pricing: {
    priceAmount?:    float | null
    priceCurrency?:  string | null
    priceUnit?:      string | null
    ...
}

#SLAProperty: {
    property?:       string | null
    value?:          string | null
    valueExt?:       string | null
    unit?:           "d" | "m" | "y" | null
    element?:        string | null
    driver?:         "regulatory" | "analytics" | "operational" | null
    ...
}

#CustomProperty: {
    property?: string | null
    value?: string | null
    ...
}

#DataContract: {
	name!:              string
    description?:       #DataContractDescription
    tenant?:            string | null
    tags?:              [...string] | null
    kind!:              "DataContract"
    dataProduct?:       #DataProduct
    status!:            string
    authoritativeDefinitions?: [...#AuthoritativeDefinitions] | null
    schema?:            [...#Schema]
    support?:           [...#Support] | null
    price?:             #Pricing
    slaDefaultElement?: string | null
    slaProperties?:     [...#SLAProperty] | null
    customProperties?:  [...#CustomProperty] | null
    contractCreatedTs?: string | null
    ...
}

id!: 				#ComponentId
description!:              string
name!:                     string
kind!:                     "outputport"
version!:                  string
infrastructureTemplateId!: string
useCaseTemplateId!:        string
dataContract!:             #DataContract
tags?:                     [...string] | null
consumable!:               bool
shoppable!:                bool
specific!:                 {}
dependsOn?: 		[...#ComponentId]
