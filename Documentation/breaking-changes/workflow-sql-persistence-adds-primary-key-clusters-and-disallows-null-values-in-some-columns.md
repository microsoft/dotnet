## Workflow SQL persistence adds primary key clusters and disallows null values in some columns

### Scope
Edge

### Version Introduced
4.7

### Source Analyzer Status
NotPlanned

### Change Description
Starting with the .NET Framework 4.7, the tables created for the SQL Workflow Instance Store 
(SWIS) by the SqlWorkflowInstanceStoreSchema.sql script use clustered primary keys. Because of 
this, identities do not support `null` values. The operation of SWIS is not impacted by this 
change. The updates were made to support SQL Server Transactional Replication.

- [ ] Quirked 
- [ ] Build-time break 

### Recommended Action
The SQL file SqlWorkflowInstanceStoreSchemaUpgrade.sql must be applied to existing installations 
in order to experience this change. New database installations will automatically have the change.

### Affected APIs
* Not detectable via API analysis

### Category
Windows Workflow Foundation (WF)

<!-- breaking change id: 180 -->
