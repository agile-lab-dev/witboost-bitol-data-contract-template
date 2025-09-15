import "strings"

let splits = strings.Split(id, ":")
let domain = splits[3]
let majorVersion = splits[5]

#Id:            string & =~"^[a-zA-Z0-9:._\\-]+$"
#ComponentId:   #Id & =~"^urn:dmb:cmp:\(domain):[a-zA-Z0-9_\\-]+:\(majorVersion):[a-zA-Z0-9_\\-]+$"
#DataProduct:   string & =~"^system:\(domain)\\.[a-zA-Z0-9_\\-]+\\.\(majorVersion)$"

#AuthoritativeDefinitions: {
        url!:   string | null
        type!:  string | null
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
    logicalType?:                *"string" | "string" | "number" | "boolean" | "object" | "array" | "date" 
    ...
}

#Quality: {
    rule?:          "text" | "sql" | "custom" | null
    type?:          string | null
    description?:   string | null
    dimension?:     "accuracy" |"completeness" | "conformity" | "consistency" | "coverage" | "timeliness" | "uniqueness" | null
    severity?:      string | null
    businessImpact?: string | null
    tags?:          [...string] | null
    authoritativeDefinitions?: [...#AuthoritativeDefinitions] | null
    scheduler?:     string | null
    schedule?:      string | null
    query?:         string | null
    operator?:      "mustBe" | "mustNotBe" | "mustBeGreaterThan" | "mustBeGreaterOrEqualTo" | "mustBeLessThan" | "mustBeLessOrEqualTo" | "mustBeBetween"| "mustNotBeBetween" | null
    engine?:        "great expectations" | null
    implementations?: string | null
    ...
}

#Properties: {
    info?: #DataContractGeneralInfo
    primaryKey?:         bool | null
    primaryKeyPosition?: int | null
    requiredProperty?:   bool | null
    unique?:             bool | null
    classification?:     string | null
    encryptedName?:      string | null
    transformSourceObject?: [...string] | null
    examples?:               [...string] | null
    criticalDataElement?:    bool | null

    arrayInfo?: info & {
        logicalType: "array"
        maxItems?: int | null
        minItems?: int | null
        uniqueItems?: bool | null
        items?: [...#Properties]
    }

    dateInfo?: info & {
        logicalType: "date"
        dataFormat?:  "yyyy-MM-dd" | "yyyy-MM-ddTHH:mm:ssZ" | "HH:mm:ss" | null
        dataRanges?: ["exclusiveMaximum" | "exclusiveMinimum" | "maximum" | "minimum"] | null
    }

    numberInfo?: info & {
        logicalType: "number" | "integer"
        numberFormat?:  "integer" | "float" | null
        numberRanges?:  ["exclusiveMaximum" | "exclusiveMinimum" | "maximum" | "minimum"] | null
        multipleOf?:    int | null
    }

    stringInfo?: info & {
        logicalType: "string"
        stringFormat?:  "email" | "password" | "byte" | "binary" | "hostname" | "ipv4" | "ipv6" | "uri" | "uuid" | null
        stringPattern?: string | null
        maxLength?:     int | null
        minLength?:     int | null
    }

    quality?:            [...#Quality] | null
    ...
}

#Schema: {
    #DataContractGeneralInfo
    properties?:    [...#Properties]
    maxProperties?: int | null
    minProperties?: int | null
    required?:      [...string]
    quality?:        [...#Quality] | null
    ...
}

#Support: {
    channel!:       string
    url!:           string
    description?:   string | null
    scope?:         string & =~ "interactive" | "announcements" | "issues" | null
    invitationUrl?: string | null
    tools?:         string & =~ "slack" | "teams" | "email" | "discord" | "ticket" | "other" | null
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
    unit?:           string & =~ "d" | "m" | "y"
    element?:        string | null
    driver?:         string & =~ "regulatory" | "analytics" | "operational"
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
    version!:           string
    status!:            string & =~ "active" | "proposed" | "draft" | "deprecated" | "retired" | "other"
    authoritativeDefinitions?: [#AuthoritativeDefinitions] | null
    schema?:            [...#Schema]
    support?:           [...#Support] | null
    price?:             #Pricing
    slaDefaultElement?: string | null
    slaProperties?:     [...#SLAProperty] | null
    customProperties:   [...#CustomProperty] | null
    contractCreatedTs?: string
    ...
}

id!: 				#ComponentId
description!:              string
name!:                     string
kind!:                     "outputport"
version!:                  string
infrastructureTemplateId!: string
useCaseTemplateId!:        string
dataContract:              #DataContract
tags?:                     [...string] | null
consumable!:               bool
shoppable!:                bool
specific!:                 {}
dependsOn?: 		[...#ComponentId] | null
