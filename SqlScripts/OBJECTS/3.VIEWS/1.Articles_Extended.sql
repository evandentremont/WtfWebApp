IF OBJECT_ID('[Articles_Extended]') IS NOT NULL DROP VIEW [Articles_Extended]
GO

CREATE VIEW [Articles_Extended] AS

    SELECT 
             ART.[Article_Id]
            ,ART.[Article_Slug]
            ,ART.[Published_Date]
            ,ART.[PublishedStatus_Name]
            ,ART.[Author_Slug]
            ,ART.[Title_Text]
            ,ART.[Series_Slug]
            ,ART.[Body_Html]
            ,ART.[Discourse_Topic_Id]
            ,ART.[Discourse_Topic_Opened]

            ,[Author_Display_Name] = AUTH.[Display_Name]
            ,[Author_Admin_Indicator] = AUTH.[Admin_Indicator]
            ,[Author_Bio_Html] = AUTH.[Bio_Html]
            ,[Author_ShortBio_Text] = AUTH.[ShortBio_Text]
            ,[Author_Image_Url] = AUTH.[Image_Url]

            ,[Series_Title_Text] = S.[Title_Text]
            ,[Series_Description_Text] = S.[Description_Text]

      FROM [Articles] ART    
    
  INNER JOIN [Series] S 
          ON S.[Series_Slug] = ART.[Series_Slug]
    
  INNER JOIN [Authors] AUTH
          ON AUTH.[Author_Slug] = ART.[Author_Slug]

GO
