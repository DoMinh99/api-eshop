Create database ESHOP 
USE [ESHOP]
GO
/****** Object:  Table [dbo].[item]    Script Date: 9/18/2020 8:14:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[item](
	[item_id] [varchar](50) NOT NULL,
	[item_group_id] [varchar](50) NULL,
	[item_name] [nvarchar](150) NULL,
	[item_image] [varchar](250) NULL,
	[item_price] [float] NULL,
 CONSTRAINT [PK_item] PRIMARY KEY CLUSTERED 
(
	[item_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[item_group]    Script Date: 9/18/2020 8:14:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[item_group](
	[parent_item_group_id] [varchar](50) NULL,
	[item_group_id] [varchar](50) NOT NULL,
	[item_group_name] [nvarchar](250) NULL,
	[seq_num] [smallint] NULL,
	[url] [varchar](150) NULL,
 CONSTRAINT [PK_item_group] PRIMARY KEY CLUSTERED 
(
	[item_group_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[item] ([item_id], [item_group_id], [item_name], [item_image], [item_price]) VALUES (N'4a9ab711-6053-43ee-bbeb-1ee5444fab88', N'1b2f3b32-d006-4ed8-ab0c-099fd86aa6dd', N'Sản phẩm 2', N'assets/img/product/product1.jpg', 432)
INSERT [dbo].[item] ([item_id], [item_group_id], [item_name], [item_image], [item_price]) VALUES (N'80537b17-305e-4081-96e8-f135156f6e90', N'1b2f3b32-d006-4ed8-ab0c-099fd86aa6dd', N'Sản phẩm 1', N'assets/img/product/product11.jpg', 123)
GO
INSERT [dbo].[item_group] ([parent_item_group_id], [item_group_id], [item_group_name], [seq_num], [url]) VALUES (N'b1e07672-95c7-4f64-abaa-43fb85657db2', N'1765fb7d-da43-4d3c-b8f0-070f84228e0c', N'Mục 12', 12, NULL)
INSERT [dbo].[item_group] ([parent_item_group_id], [item_group_id], [item_group_name], [seq_num], [url]) VALUES (N'b1e07672-95c7-4f64-abaa-43fb85657db2', N'1b2f3b32-d006-4ed8-ab0c-099fd86aa6dd', N'Mục 11', 11, NULL)
INSERT [dbo].[item_group] ([parent_item_group_id], [item_group_id], [item_group_name], [seq_num], [url]) VALUES (NULL, N'4a12aa7a-8604-4ce3-a223-35f729b2ceec', N'Mục 2', 2, NULL)
INSERT [dbo].[item_group] ([parent_item_group_id], [item_group_id], [item_group_name], [seq_num], [url]) VALUES (NULL, N'728a4f13-18ae-4d82-bd08-ec34deb36ef4', N'Mục 3', 3, NULL)
INSERT [dbo].[item_group] ([parent_item_group_id], [item_group_id], [item_group_name], [seq_num], [url]) VALUES (N'4a12aa7a-8604-4ce3-a223-35f729b2ceec', N'98cd5a4a-2610-4c4e-9e1e-3f767fbc74cf', N'Mục 21', 21, NULL)
INSERT [dbo].[item_group] ([parent_item_group_id], [item_group_id], [item_group_name], [seq_num], [url]) VALUES (NULL, N'b1e07672-95c7-4f64-abaa-43fb85657db2', N'Mục 1', 1, NULL)
INSERT [dbo].[item_group] ([parent_item_group_id], [item_group_id], [item_group_name], [seq_num], [url]) VALUES (N'b1e07672-95c7-4f64-abaa-43fb85657db2', N'bbc3c5a5-a45b-4879-8e70-9cb0ea1dae92', N'Mục 13', 13, NULL)
GO
/****** Object:  StoredProcedure [dbo].[sp_item_all]    Script Date: 9/18/2020 8:14:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
create PROCEDURE [dbo].[sp_item_all]
AS
    BEGIN
        SELECT item.item_id, 
               item.item_group_id, 
               item.item_image, 
			   item.item_name, 
			   item.item_price                         
        FROM item 
    END;
GO
/****** Object:  StoredProcedure [dbo].[sp_item_create]    Script Date: 9/18/2020 8:14:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
create PROCEDURE [dbo].[sp_item_create]
(@item_id             VARCHAR(50), 
 @item_group_id       VARCHAR(50), 
 @item_image          VARCHAR(250), 
 @item_name           NVARCHAR(150), 
 @item_price          float  
)
AS
    BEGIN
      INSERT INTO item
                (item_id, 
                 item_group_id, 
                 item_image, 
                 item_name, 
                 item_price                 
                )
                VALUES
                (@item_id, 
                 @item_group_id, 
                 @item_image, 
                 @item_name, 
                 @item_price 
                );
        SELECT '';
    END;
GO
/****** Object:  StoredProcedure [dbo].[sp_item_get_by_id]    Script Date: 9/18/2020 8:14:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE PROCEDURE [dbo].[sp_item_get_by_id](@item_id VARCHAR(50))
AS
    BEGIN
        SELECT item.item_id, 
               item.item_group_id, 
               item.item_image, 
			   item.item_name, 
			   item.item_price                         
        FROM item
      where  item.item_id = @item_id;
    END;
GO
/****** Object:  StoredProcedure [dbo].[sp_item_group_get_data]    Script Date: 9/18/2020 8:14:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_item_group_get_data]
AS
    BEGIN
        SELECT item_group.parent_item_group_id, 
               item_group.item_group_id, 
               item_group.item_group_name, 
               item_group.seq_num,
			   item_group.url
        FROM item_group
        ORDER BY item_group.seq_num;
    END;
GO
USE [master]
GO
ALTER DATABASE [ESHOP] SET  READ_WRITE 
GO
