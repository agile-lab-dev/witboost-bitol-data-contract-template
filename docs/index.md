### Prerequisites

A Data Product should already exist in order to attach the new components to it.

### Component Basic Information

This section includes the basic information that any Component of Witboost must have:

- **Name**: Required name used for display purposes on your Data Product.
- **Description**: A short description to help others understand what this Output Port is for.
- **Domain**: The domain of the Data Product this Output Port belongs to. Be sure to choose it correctly as it is a fundamental part of the Output Port and cannot be changed afterwards.
- **Data Product**: The Data Product this Output Port belongs to; be sure to choose the right one.
- **Identifier**: Unique ID for this new entity inside the domain. Don't worry about filling this field; it will be automatically filled for you.
- **Development group**: Development group of this Data Product. Don't worry about filling this field; it will be automatically filled for you.
- **Depends on**: If you want your Output Port to depend on other components (i.e. its creation workload) from the Data Product, you can choose this option (Optional).

*Example:*

| Field name              | Example value                                                                                          |
|:------------------------|:-------------------------------------------------------------------------------------------------------|
| **Name**                | BITOL Data Contract Output Port                                                                                 |
| **Description**         | Create a BITOL Data Contract output port                                                                        |
| **Domain**              | domain:healthcare                                                                                      |
| **Data Product**        | system:healthcare.vaccinationsdp.0                                                                     |
| ***Identifier***        | Will look something like this: *healthcare.bitoldatacontracttest.0.bitoldatacontract-outputport*                     |
| ***Development Group*** | Might look something like this: *group:datameshplatform* Depends on the Data Product development group |


### Data Contract Details

This section provides details about the BITOL Data Contract configuration:

- [BITOL Data Contract](#bitol-data-contract)
- [Schema](#schema)
- [Data Quality](#data-quality)
- [Support and Communication Channel](#support-and-communication-channel)
- [Pricing](#pricing)
- [Service Level Agreement (SLA)](#service-level-agreement-sla)
- [Custom Properties](#custom-properties)
- [Other Properties](#other-properties)



### BITOL Data Contract

General fields for BITOL Data Contract.

- **nameDC**: Name of the Data Contract
- **status**: Current status of the data contract (e.g., active, draft, deprecated)
- **authoritativeDefinitions**: Definitions or rules that establish the data contract (this field are both at the data contract level and the description level).
- **purpose**: Intended purpose for the provided data (from description)
- **limitation**: Technical, compliance, and legal limitations for data use (from description)
- **usage**: Recommended usage of the data (from description)
- **tenant**: Indicates the property the data is primarily associated with
- **tags**: Tags for the data contract

*Example:*

| Field name                   | Example value                                   |
|:-----------------------------|:------------------------------------------------|
| **nameDC**                   | BITOL Data Contract                             |
| **status**                   | active                                          |
| **purpose**                  | Provide vaccination data                        |
| **limitation**               | Data updated weekly                             |
| **usage**                    | Analytics                                       |
| **tenant**                   | system:healthcare.vaccinationsdp.0              |
| **tags**                     | [healthcare, vaccination]                       |
| **AuthoritativeDefinitions** | [Authoritative Definitions](#authoritative-definitions)  |


### Schema

Schema definition for the data contract, describing the structure of tables, columns, and their properties.

These fields are both at the table level and the column level:

- **name**: The name of the table.
- **description**: A short description of the column or table purpose.
- **businessName**: The business-friendly name of the table or column used in reports or documentation.
- **AuthoritativeDeflnitions**: Definitions or rules that establish the table or column as a trusted source of data.
- **tags**: List of Labels or keywords used to categorize the table or column.
- **dataGranularityDescription**: Description of the level of detail of the data contained in the table or column.

*Example:*

| Field name                       | Example value                                          |
|:---------------------------------|:-------------------------------------------------------|
| **name**                         | vaccinations                                    |
| **description**                  | Vaccination records table                       |
| **businessName**                 | Vaccinations                                    |
| **AuthoritativeDefinitions**     | [Authoritative Definitions](#authoritative-definitions)                          |
| **tags**                         | [healthcare, vaccination]                       |
| **dataGranularityDescription**   | Daily                                           |

Fields that are at the column level.

- **maxProperties**: Specifies the maximum number of properties allowed in a schema object.
- **minProperties**: Specifies the minimum number of properties required in a schema object.
- **requiredField**: Indicates whether a particular field is mandatory within the schema.
- **schemaProperties**: Defines the list of properties (columns) in the schema, including each property’s name and logical type.


*Example:*

| Field name          | Example value                                     |
|:--------------------|:---------------------------------------------------|
| **maxProperties**   | 10                                                |
| **minProperties**   | 2                                                 |
| **requiredField**   | [customerId, name, surname]                       |
| **schemaProperties**|[Schema Properties](#schema-properties)            |


#### Schema Properties

- **primaryKey**: Indicates the field that uniquely identifies a record in the table.
- **requiredProperty**: Specifies whether the field is mandatory.
- **unique**: Indicates if the values in this field must be unique across all records.
- **classification**: The sensitivity or data classification of the field (e.g., confidential, public).
- **encryptedName**: The name of the field when stored in an encrypted format.
- **transformSourceObjects**: Specifies any transformations applied to the source data for this field.
- **examples**: Sample values for the field to illustrate its content.
- **criticalDataElement**: Indicates whether this field is considered critical for business or regulatory purposes.
- **logicalType**: The data type or logical type of the field (e.g., integer, string, date).


*Example:*

| Field name                | Example value                                   |
|:--------------------------|:------------------------------------------------|
| **primaryKey**            | true                                            |
| **requiredProperty**      | true                                            |
| **unique**                | false                                           |
| **classification**        | Confidential                                    |
| **encryptedName**         | cust_id_encrypted                               |
| **transformSourceObjects**| [hash_function_applied, hash_function]          |
| **examples**              | [12345, 67890]                                  |
| **criticalDataElement**   | true                                            |
| **logicalType**           | integer                                         |


### Data Quality

Data Quality Expectations for BITOL data contracts.

- **nameTable**: Table name (selectable).
- **nameColumn**: Column name (must match an existing column).
- **quality**: List of elements qualities.

> The ***table name*** on which to add a quality rule is selectable from existing tables, while the ***column name*** must be entered manually by the user.
    Make sure to use the exact name of an existing column. Also, **the combination of table and column name should not be repeated** to avoid duplicate quality rules.

*Example:*

| Field name        | Example value           |
|:------------------|:-----------------------|
| **nameTable**     | vaccinations           |
| **nameColumn**    | patient_id             |
| **qualities**     | [Qualities](#qualities)             |

#### Qualities

- **nameQuality**: The name of the quality metric or rule.
- **descriptionQuality**: A short description explaining what the quality represents.
- **typeQuality**: The type of quality check (e.g., test, sql, custom).
- **dimension**: The dimension or aspect of data quality that this quality affects (selectable)
- **severity**: The severity level of the quality issue (e.g., low, medium, high).
- **businessImpact**: Description of the potential impact on business if the quality is not met.
- **qualityTags**: Tags or labels used to categorize the quality.
- **authoritativeDefinitions**: Definitions establishing the field or table as a trusted source.
- **scheduler**: Name of the scheduler or job that runs this quality check.
- **schedule**: The timing or frequency when the quality check is executed.

*Example:*

| Field name                   | Example value                               |
|:-----------------------------|:-------------------------------------------|
| **nameQuality**              | completeness_check_customer_id             |
| **descriptionQuality**       | Ensures all customer IDs are present       |
| **typeQuality**              | sql                                        |
| **dimension**                | accuracy                                   |
| **severity**                 | High                                       |
| **businessImpact**           | Missing IDs affect reporting and billing   |
| **qualityTags**              | [mandatory, critical]                      |
| **authoritativeDefinitions** | [Authoritative Definitions](#authoritative-definitions) |
| **scheduler**                | daily_data_quality_job                     |
| **schedule**                 | Daily at 02:00 AM                          |


### Support and Communication Channel

Brief information about available support or communication channels, including type, link, description, and scope.

- **channel**: Channel name (e.g., Slack)
- **urlChannel**: URL to the channel
- **descriptionChannel**: Short description
- **scope**: The scope of the support or communication channel. (interactive, announcements, issues)
- **invitationUrl**: The URL for inviting users to the support or communication channel.
- **tools**: Tool name (slack, teams, email, etc.)

*Example:*

| Field name             | Example value                                      |
|:-----------------------|:--------------------------------------------------|
| **channel**            | Slack                                             |
| **urlChannel**         | https://slack.com/yourworkspace                   |
| **descriptionChannel** | Team communication and notifications              |
| **scope**              | interactive                                       |
| **invitationUrl**      | https://slack.com/invite/abcd1234                 |
| **tools**              | slack                                             |


### Pricing

Details about the pricing model, costs, or billing information associated with the data contract or its usage.

- **priceAmount**: Subscription price per unit
- **priceCurrency**: Currency of the price
- **priceUnit**: Unit of measure for the price

*Example:*

| Field name                | Example value                                 |
|:--------------------------|:----------------------------------------------|
| **priceAmount**           | 9.95                                          |
| **priceCurrency**         | USD                                           |
| **priceUnit**             | megabyte                                      |


### Service Level Agreement (SLA)

List of Service Level Agreement (SLA) properties, each describing a specific quality or guarantee.

- **slaDefaultElement**: Default element for the SLA
- **propertySLA**: SLA property (from slaProperties)
- **valueSLA**: Value for the property (from slaProperties)
- **valueExt**: Extended value (from slaProperties)
- **unitSLA**: Unit of measurement (from slaProperties)
- **elementSLA**: Element(s) to check (from slaProperties)
- **driverSLA**: Importance (regulatory, analytics, operational) (from slaProperties)

*Example:*

| Field name            | Example value                         |
|:----------------------|:--------------------------------------|
| **slaDefaultElement** | default_customer_response_time        |
| **propertySLA**       | maxResponseTime                       |
| **valueSLA**          | 24                                    |
| **valueExt**          | 48                                    |
| **unitSLA**           | d                                     |
| **elementSLA**        | customer_service_request              |
| **driverSLA**         | operational                           |


### Custom Properties

Any custom or user-defined properties that extend the standard contract fields for specific needs.

- **customProperty**: Name of the custom property
- **customValue**: Value of the custom property

*Example:*

| Field name                | Example value                                 |
|:--------------------------|:----------------------------------------------|
| **customProperty**        | dataSensitivity                               |
| **customValue**           | high                                          |


### Other Properties

- **contractCreatedTs**: Timestamp indicating when the data contract was created.

*Example:*

| Field name                | Example value                                                   |
|:--------------------------|:----------------------------------------------------------------|
| **contractCreatedTs**     | 2025-09-08T10:00:00Z                                            |

### Authoritative Definitions

| Field name                  | Example value                                   |
|:----------------------------|:------------------------------------------------|
| **typeAuthoritative**       | vaccination-guideline                           |
| **urlAuthoritative**        | https://example.com/vaccination-guidelines.pdf  |

Additional information about the specifications can be found at [Open Data Contract Standard](https://bitol-io.github.io/open-data-contract-standard/latest/).

---

After this the system will show you the summary of the template, and you can go back and edit or go ahead and create the Component.

After clicking on "Create" the registering of the Component will start. If no errors occurred it will go through the 3 phases (Fetching, Publishing and Registering) and will give you the links to the newly created Repository and the component in the Catalog.

**Be careful not to delete the `catalog-info.yml` as well as keep the project structure as given.**