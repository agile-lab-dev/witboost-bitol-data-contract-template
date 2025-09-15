## Component basic information

| Field name              | Example value                                      |
|:------------------------|:---------------------------------------------------|
| **Name**                | ${{ values.name }}                                |
| **Description**         | ${{ values.description }}                         |
| **Domain**              | ${{ values.domain }}                              |
| **Data Product**        | ${{ values.dataproduct }}                         |
| **_Identifier_**        | ${{ values.identifier }}                          |
| **_Development Group_** | ${{ values.owner }}                    |
| **Depends On**          | ${{ values.dependsOn }}                           |


## Data Contract details

| Field name                    | Example value                                      |
|:------------------------------|:---------------------------------------------------|
| **Name**                      | ${{ values.nameDC }}                                |
| **Description**               |                                                     |
| **Purpose**                   | ${{ values.purpose }}                         |
| **Limitations**               | ${{ values.limitation}}                                  |
| **Usage**                     | ${{ values.usage}}                                  |
| **Tenant**                    | ${{ values.tenant }}       |
| **Tags**                      | ${{ values.tags | dump }} |
| **Status**                    | ${{ values.status }}       |

{% if values.schemas.elements | length > 0 %}
## Schema, properties and qualities detalis

| Field name                             | Example value                       |{% for schema in values.schemas.elements %}
|:---------------------------------------|:------------------------------------|
| **Table name ${{ loop.index }}**                       | ${{ schema.elementName | dump }}                    |{% for qualityInfo in values.qualitiesInfo -%}
{% if (qualityInfo.nameColumn is not defined) or (not qualityInfo.nameColumn) and qualityInfo.nameTable.label == schema.elementName -%}{% for quality in qualityInfo.objQualities.qualities %}
| **Quality table name**                 | ${{ quality.nameQuality | dump }}                      |
| **Quality table type**                 | ${{ quality.typeQuality | dump }}   |{% endfor -%}{% endif -%}{% endfor -%}{% for property in schema.schemaProperties %}
| **Column name ${{ loop.index }}**                      | ${{ property.elementName | dump }}                  |
| **Logical type**                       | ${{ property.logicalType | dump }}                      |
{% for qualityInfo in values.qualitiesInfo -%}{% if qualityInfo.nameColumn == property.elementName and qualityInfo.nameTable.label == schema.elementName -%}{% for qualityCol in qualityInfo.objQualities.qualities -%}
| **Quality column name**                | ${{ qualityCol.nameQuality | dump }}                |
| **Quality column type**                | ${{ qualityCol.typeQuality | dump }}                |{% endfor -%}{% endif -%}{% endfor -%}
{% endfor -%}{% endfor -%}

{% endif %}
