
DECLARE @HTMLBody NVARCHAR(MAX);


WITH IndexMetadata AS (
    SELECT 
        t.name AS TableName,
        i.name AS IndexName,
        i.type_desc AS IndexType,
        c.name AS ColumnName,
        TYPE_NAME(c.user_type_id) AS ColumnType
    FROM sys.indexes i
    INNER JOIN sys.index_columns ic ON i.object_id = ic.object_id AND i.index_id = ic.index_id
    INNER JOIN sys.columns c ON ic.object_id = c.object_id AND ic.column_id = c.column_id
    INNER JOIN sys.tables t ON i.object_id = t.object_id
    WHERE i.type > 0 
)

SELECT @HTMLBody = 
    '<html><body><h3>Index Metadata Report</h3>' +
    '<style>' +
    'table {border-collapse: collapse; width: 100%; font-family: Arial, sans-serif;}' +
    'th, td {border: 1px solid black; padding: 8px; text-align: left;}' +
    'th {background-color: #f2f2f2;}' +
    '</style>' +
    '<table>' +
    '<tr><th>Table Name</th><th>Index Name</th><th>Index Type</th><th>Column Name</th><th>Column Type</th></tr>' +
    STRING_AGG(
        '<tr><td>' + TableName + '</td>' +
        '<td>' + ISNULL(IndexName, 'N/A') + '</td>' +
        '<td>' + IndexType + '</td>' +
        '<td>' + ColumnName + '</td>' +
        '<td>' + ColumnType + '</td></tr>',
        ''
    ) +
    '</table></body></html>'
FROM IndexMetadata;


EXEC msdb.dbo.sp_send_dbmail
    @profile_name = 'YourDatabaseMailProfile',
    @recipients = 'recipient@example.com', 
    @subject = 'Index Metadata Report',
    @body = @HTMLBody,
    @body_format = 'HTML';
