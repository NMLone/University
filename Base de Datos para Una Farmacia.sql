USE [master]
GO
/****** Base de datos para una Farmacia hecho por:******/
/******Rafael Emilio Rodriguez Berroa  20-MIIT-1-028 ******/
/******Seccion: 0541 ******/
CREATE DATABASE [Farmacia]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Farmacia', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Farmacia.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Farmacia_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Farmacia_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Farmacia] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Farmacia].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Farmacia] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Farmacia] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Farmacia] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Farmacia] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Farmacia] SET ARITHABORT OFF 
GO
ALTER DATABASE [Farmacia] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Farmacia] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Farmacia] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Farmacia] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Farmacia] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Farmacia] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Farmacia] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Farmacia] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Farmacia] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Farmacia] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Farmacia] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Farmacia] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Farmacia] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Farmacia] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Farmacia] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Farmacia] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Farmacia] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Farmacia] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Farmacia] SET  MULTI_USER 
GO
ALTER DATABASE [Farmacia] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Farmacia] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Farmacia] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Farmacia] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Farmacia] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Farmacia] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Farmacia] SET QUERY_STORE = OFF
GO
USE [Farmacia]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 24/4/2022 12:05:39 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[Id_Cliente] [int] IDENTITY(82,1) NOT NULL,
	[Nombre] [varchar](20) NOT NULL,
	[Direccion] [varchar](50) NULL,
	[Telefono] [decimal](10, 0) NULL,
	[Correo_Electronico] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleados]    Script Date: 24/4/2022 12:05:39 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleados](
	[Id_Empleado] [int] IDENTITY(165,1) NOT NULL,
	[Nombre] [varchar](20) NOT NULL,
	[Telefono] [decimal](10, 0) NULL,
	[Correo_Electronico] [varchar](50) NULL,
	[Cargo] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Empleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pedidos]    Script Date: 24/4/2022 12:05:39 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pedidos](
	[Id_Pedido] [int] IDENTITY(568947864,1) NOT NULL,
	[Id_Cliente] [int] NULL,
	[Id_Empleado] [int] NULL,
	[Id_Producto] [int] NULL,
	[Cantidad_de_producto] [varchar](10) NULL,
	[Monto_a_Pagar] [decimal](10, 0) NULL,
	[Fecha] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Pedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Productos_Farmaceuticos]    Script Date: 24/4/2022 12:05:39 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos_Farmaceuticos](
	[Id_Producto] [int] IDENTITY(42,1) NOT NULL,
	[Id_Proveedor] [int] NULL,
	[Nombre] [varchar](40) NOT NULL,
	[Componente] [varchar](40) NOT NULL,
	[FechVencimiento] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proveedores]    Script Date: 24/4/2022 12:05:39 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proveedores](
	[Id_Proveedor] [int] IDENTITY(22,1) NOT NULL,
	[Nombre] [varchar](20) NOT NULL,
	[Telefono] [decimal](10, 0) NULL,
	[Correo_Electronico] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Proveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Cliente] ON 

INSERT [dbo].[Cliente] ([Id_Cliente], [Nombre], [Direccion], [Telefono], [Correo_Electronico]) VALUES (82, N'Jose Ramos', N'C/ 14 de febrero, #65 A, los alcarizos, St, R.D.', CAST(8096755856 AS Decimal(10, 0)), N'JoseRamos@gmail.com')
INSERT [dbo].[Cliente] ([Id_Cliente], [Nombre], [Direccion], [Telefono], [Correo_Electronico]) VALUES (83, N'Maria Mercedes', N'Av. Jose contraras, #76, las praderas, S.T, R.D.', CAST(8298759472 AS Decimal(10, 0)), N'MariaMercedes@hotmail.com')
INSERT [dbo].[Cliente] ([Id_Cliente], [Nombre], [Direccion], [Telefono], [Correo_Electronico]) VALUES (84, N'Rosa Leon', N'C/ San Juan, #83, san miguel, S.T, R.D.', CAST(8497549274 AS Decimal(10, 0)), N'RosaLeon@gmail.com')
INSERT [dbo].[Cliente] ([Id_Cliente], [Nombre], [Direccion], [Telefono], [Correo_Electronico]) VALUES (85, N'Carlos Galvan', N'AV. Independencia, #7, S.t, R.D', CAST(8097592443 AS Decimal(10, 0)), N'CarlosGalvan@hotmail.com')
INSERT [dbo].[Cliente] ([Id_Cliente], [Nombre], [Direccion], [Telefono], [Correo_Electronico]) VALUES (86, N'Juaquin Mena', N'C/ Los girasoles, #65, las praderas, S.T, R.D. ', CAST(8295837694 AS Decimal(10, 0)), N'JuaquinMena@gmail.com')
INSERT [dbo].[Cliente] ([Id_Cliente], [Nombre], [Direccion], [Telefono], [Correo_Electronico]) VALUES (87, N'Dolores Perez', N'C/ Ramon Reyes, #65, alto de las flore, S.T, R.D', CAST(8498398298 AS Decimal(10, 0)), N'DoloresPerez@hotmail.com')
INSERT [dbo].[Cliente] ([Id_Cliente], [Nombre], [Direccion], [Telefono], [Correo_Electronico]) VALUES (88, N'Romona Aquino', N'C/ Alma Rosa, #2, Las americas, S.T, R.D', CAST(8098390965 AS Decimal(10, 0)), N'RomonaAquino@gmail.com')
INSERT [dbo].[Cliente] ([Id_Cliente], [Nombre], [Direccion], [Telefono], [Correo_Electronico]) VALUES (89, N'Balbara Jimenez', N'Av. 27 de febrero, #55, S.T, R.D', CAST(8294831231 AS Decimal(10, 0)), N'BalbaraJimenez@hotmail.com')
INSERT [dbo].[Cliente] ([Id_Cliente], [Nombre], [Direccion], [Telefono], [Correo_Electronico]) VALUES (90, N'Josefa Melendez', N'C/ Brisa del norte, #46, caonabo, S.T, R.D ', CAST(8497428532 AS Decimal(10, 0)), N'JosefaMelendez@gmail.com')
INSERT [dbo].[Cliente] ([Id_Cliente], [Nombre], [Direccion], [Telefono], [Correo_Electronico]) VALUES (91, N'Albaro Ruiz', N'Av. Winston Churchill, #64, S.T, R.D', CAST(8097592264 AS Decimal(10, 0)), N'AlbaroRuiz@hotmail.com')
SET IDENTITY_INSERT [dbo].[Cliente] OFF
GO
SET IDENTITY_INSERT [dbo].[Empleados] ON 

INSERT [dbo].[Empleados] ([Id_Empleado], [Nombre], [Telefono], [Correo_Electronico], [Cargo]) VALUES (165, N'Yesica Moreno', CAST(8496576473 AS Decimal(10, 0)), N'YesicaMoreno@gmail.com', N'Vendedora')
INSERT [dbo].[Empleados] ([Id_Empleado], [Nombre], [Telefono], [Correo_Electronico], [Cargo]) VALUES (166, N'Yolanjel Amarante', CAST(8096336382 AS Decimal(10, 0)), N'NULLYolanjelAmarante@gmail.com', N'Vendedora')
INSERT [dbo].[Empleados] ([Id_Empleado], [Nombre], [Telefono], [Correo_Electronico], [Cargo]) VALUES (167, N'Darianny Lemos', CAST(8298534251 AS Decimal(10, 0)), N'DariannyLemos@hotmail.com', N'Admistradora')
INSERT [dbo].[Empleados] ([Id_Empleado], [Nombre], [Telefono], [Correo_Electronico], [Cargo]) VALUES (168, N'Alfredo Peralta', CAST(8097398493 AS Decimal(10, 0)), N'AlfredoPeralta@hotmail.com
', N'Encargado de venta')
INSERT [dbo].[Empleados] ([Id_Empleado], [Nombre], [Telefono], [Correo_Electronico], [Cargo]) VALUES (169, N'Joan Perez', CAST(8299476728 AS Decimal(10, 0)), N'JoanPerez@gmail.com
', N'Vendedor')
INSERT [dbo].[Empleados] ([Id_Empleado], [Nombre], [Telefono], [Correo_Electronico], [Cargo]) VALUES (170, N'Antonio Mendez', CAST(8496332321 AS Decimal(10, 0)), N'AntonioMendez@hotmail.com', N'Vendedor')
INSERT [dbo].[Empleados] ([Id_Empleado], [Nombre], [Telefono], [Correo_Electronico], [Cargo]) VALUES (171, N'Alejandro Medina', CAST(8496203252 AS Decimal(10, 0)), N'AlejandroMedina@gmail.com
', N'Vendedor')
INSERT [dbo].[Empleados] ([Id_Empleado], [Nombre], [Telefono], [Correo_Electronico], [Cargo]) VALUES (172, N'Bianca Perdomo', CAST(8297498183 AS Decimal(10, 0)), N'BiancaPerdomo@hotmail.com', N'Conserje')
INSERT [dbo].[Empleados] ([Id_Empleado], [Nombre], [Telefono], [Correo_Electronico], [Cargo]) VALUES (173, N'Maria Ramirez', CAST(8096378394 AS Decimal(10, 0)), N'MariaRamirez@gmail.com', N'Cajera')
INSERT [dbo].[Empleados] ([Id_Empleado], [Nombre], [Telefono], [Correo_Electronico], [Cargo]) VALUES (174, N'Veronica Diaz ', CAST(8497297392 AS Decimal(10, 0)), N'VeronicaDiaz@hotmail.com ', N'Cajera')
SET IDENTITY_INSERT [dbo].[Empleados] OFF
GO
SET IDENTITY_INSERT [dbo].[Pedidos] ON 

INSERT [dbo].[Pedidos] ([Id_Pedido], [Id_Cliente], [Id_Empleado], [Id_Producto], [Cantidad_de_producto], [Monto_a_Pagar], [Fecha]) VALUES (568947864, 82, 165, 43, N'2', CAST(1300 AS Decimal(10, 0)), CAST(N'2022-01-25' AS Date))
INSERT [dbo].[Pedidos] ([Id_Pedido], [Id_Cliente], [Id_Empleado], [Id_Producto], [Cantidad_de_producto], [Monto_a_Pagar], [Fecha]) VALUES (568947865, 83, 166, 45, N'5', CAST(1500 AS Decimal(10, 0)), CAST(N'2022-01-30' AS Date))
INSERT [dbo].[Pedidos] ([Id_Pedido], [Id_Cliente], [Id_Empleado], [Id_Producto], [Cantidad_de_producto], [Monto_a_Pagar], [Fecha]) VALUES (568947866, 84, 167, 46, N'6', CAST(2200 AS Decimal(10, 0)), CAST(N'2022-02-02' AS Date))
INSERT [dbo].[Pedidos] ([Id_Pedido], [Id_Cliente], [Id_Empleado], [Id_Producto], [Cantidad_de_producto], [Monto_a_Pagar], [Fecha]) VALUES (568947867, 85, 165, 47, N'25', CAST(3500 AS Decimal(10, 0)), CAST(N'2022-02-04' AS Date))
INSERT [dbo].[Pedidos] ([Id_Pedido], [Id_Cliente], [Id_Empleado], [Id_Producto], [Cantidad_de_producto], [Monto_a_Pagar], [Fecha]) VALUES (568947869, 87, 166, 46, N'46', CAST(6500 AS Decimal(10, 0)), CAST(N'2022-02-15' AS Date))
INSERT [dbo].[Pedidos] ([Id_Pedido], [Id_Cliente], [Id_Empleado], [Id_Producto], [Cantidad_de_producto], [Monto_a_Pagar], [Fecha]) VALUES (568947870, 88, 171, 50, N'8', CAST(200 AS Decimal(10, 0)), CAST(N'2022-02-27' AS Date))
INSERT [dbo].[Pedidos] ([Id_Pedido], [Id_Cliente], [Id_Empleado], [Id_Producto], [Cantidad_de_producto], [Monto_a_Pagar], [Fecha]) VALUES (568947871, 89, 171, 55, N'60', CAST(10000 AS Decimal(10, 0)), CAST(N'2022-03-14' AS Date))
INSERT [dbo].[Pedidos] ([Id_Pedido], [Id_Cliente], [Id_Empleado], [Id_Producto], [Cantidad_de_producto], [Monto_a_Pagar], [Fecha]) VALUES (568947872, 90, 166, 45, N'25', CAST(7500 AS Decimal(10, 0)), CAST(N'2022-03-17' AS Date))
INSERT [dbo].[Pedidos] ([Id_Pedido], [Id_Cliente], [Id_Empleado], [Id_Producto], [Cantidad_de_producto], [Monto_a_Pagar], [Fecha]) VALUES (568947873, 91, 165, 55, N'6', CAST(1000 AS Decimal(10, 0)), CAST(N'2022-03-30' AS Date))
INSERT [dbo].[Pedidos] ([Id_Pedido], [Id_Cliente], [Id_Empleado], [Id_Producto], [Cantidad_de_producto], [Monto_a_Pagar], [Fecha]) VALUES (568947874, 86, 166, 45, N'2', CAST(600 AS Decimal(10, 0)), CAST(N'2022-03-30' AS Date))
SET IDENTITY_INSERT [dbo].[Pedidos] OFF
GO
SET IDENTITY_INSERT [dbo].[Productos_Farmaceuticos] ON 

INSERT [dbo].[Productos_Farmaceuticos] ([Id_Producto], [Id_Proveedor], [Nombre], [Componente], [FechVencimiento]) VALUES (42, 33, N'Acetaminofen', N'Hidroxifenil', CAST(N'2024-04-02' AS Date))
INSERT [dbo].[Productos_Farmaceuticos] ([Id_Producto], [Id_Proveedor], [Nombre], [Componente], [FechVencimiento]) VALUES (43, 23, N'Amoxicilina', N'Estearato de magnesio', CAST(N'2023-05-06' AS Date))
INSERT [dbo].[Productos_Farmaceuticos] ([Id_Producto], [Id_Proveedor], [Nombre], [Componente], [FechVencimiento]) VALUES (45, 32, N'Betahistina', N'piridilalquila,minas monohidrato', CAST(N'2024-09-12' AS Date))
INSERT [dbo].[Productos_Farmaceuticos] ([Id_Producto], [Id_Proveedor], [Nombre], [Componente], [FechVencimiento]) VALUES (46, 26, N'Cefalcor', N'Monohidrato', CAST(N'2024-12-02' AS Date))
INSERT [dbo].[Productos_Farmaceuticos] ([Id_Producto], [Id_Proveedor], [Nombre], [Componente], [FechVencimiento]) VALUES (47, 31, N'Acetaminofén Gotas Pediátricas', N'Aspirina, ibuprofeno', CAST(N'2023-01-15' AS Date))
INSERT [dbo].[Productos_Farmaceuticos] ([Id_Producto], [Id_Proveedor], [Nombre], [Componente], [FechVencimiento]) VALUES (50, 22, N'Complejo B', N'tiamina, la riboflavina, la niacina ', CAST(N'2023-04-06' AS Date))
INSERT [dbo].[Productos_Farmaceuticos] ([Id_Producto], [Id_Proveedor], [Nombre], [Componente], [FechVencimiento]) VALUES (51, 24, N'Dexametasona', N'edetato de disodio, citrato de sodio ', CAST(N'2023-07-09' AS Date))
INSERT [dbo].[Productos_Farmaceuticos] ([Id_Producto], [Id_Proveedor], [Nombre], [Componente], [FechVencimiento]) VALUES (53, 27, N'Enalapril', N'monohidrato, hidrogenocarbonato de sodio', CAST(N'2024-05-07' AS Date))
INSERT [dbo].[Productos_Farmaceuticos] ([Id_Producto], [Id_Proveedor], [Nombre], [Componente], [FechVencimiento]) VALUES (55, 25, N'Fluconazol', N'actosa ', CAST(N'2024-06-27' AS Date))
INSERT [dbo].[Productos_Farmaceuticos] ([Id_Producto], [Id_Proveedor], [Nombre], [Componente], [FechVencimiento]) VALUES (56, 22, N'ibuprofeno', N'roscarmelosa de sodio', CAST(N'2023-07-24' AS Date))
INSERT [dbo].[Productos_Farmaceuticos] ([Id_Producto], [Id_Proveedor], [Nombre], [Componente], [FechVencimiento]) VALUES (57, 25, N'Omeprasol', N'microgránulos neutros', CAST(N'2024-12-11' AS Date))
SET IDENTITY_INSERT [dbo].[Productos_Farmaceuticos] OFF
GO
SET IDENTITY_INSERT [dbo].[Proveedores] ON 

INSERT [dbo].[Proveedores] ([Id_Proveedor], [Nombre], [Telefono], [Correo_Electronico]) VALUES (22, N'Pharmatech S,A', CAST(8095210987 AS Decimal(10, 0)), N'PharmatechS,A@hotmail.com')
INSERT [dbo].[Proveedores] ([Id_Proveedor], [Nombre], [Telefono], [Correo_Electronico]) VALUES (23, N'Dronena', CAST(8091554563 AS Decimal(10, 0)), N'Dronena@gmail.com')
INSERT [dbo].[Proveedores] ([Id_Proveedor], [Nombre], [Telefono], [Correo_Electronico]) VALUES (24, N'Laboratorio San Luis', CAST(8293657438 AS Decimal(10, 0)), N'Laboratorio_San_Luis@gmail.com')
INSERT [dbo].[Proveedores] ([Id_Proveedor], [Nombre], [Telefono], [Correo_Electronico]) VALUES (25, N'Letargo,SRL.', CAST(8296759834 AS Decimal(10, 0)), N'Letargo@gmail.com')
INSERT [dbo].[Proveedores] ([Id_Proveedor], [Nombre], [Telefono], [Correo_Electronico]) VALUES (26, N'Laboratorios Alfa', CAST(8499577487 AS Decimal(10, 0)), N'LAlfa@gmail.com')
INSERT [dbo].[Proveedores] ([Id_Proveedor], [Nombre], [Telefono], [Correo_Electronico]) VALUES (27, N'CYMACLA Laboratory', CAST(8498367645 AS Decimal(10, 0)), N'CYMACLA_Laboratory@gmail.com')
INSERT [dbo].[Proveedores] ([Id_Proveedor], [Nombre], [Telefono], [Correo_Electronico]) VALUES (28, N'Disfarmaco', CAST(8097450875 AS Decimal(10, 0)), N'Disfarmaco@hotmail.com')
INSERT [dbo].[Proveedores] ([Id_Proveedor], [Nombre], [Telefono], [Correo_Electronico]) VALUES (31, N'Lab Rowe Plata', CAST(8296548746 AS Decimal(10, 0)), N'LRowePlata@gmail.com')
INSERT [dbo].[Proveedores] ([Id_Proveedor], [Nombre], [Telefono], [Correo_Electronico]) VALUES (32, N'Clinimed SRL', CAST(8496537464 AS Decimal(10, 0)), N'Clinimed_SRL@gmail,com')
INSERT [dbo].[Proveedores] ([Id_Proveedor], [Nombre], [Telefono], [Correo_Electronico]) VALUES (33, N'Lab Farmamed D.', CAST(8095372132 AS Decimal(10, 0)), N'FarmamedLab@gmail.com')
SET IDENTITY_INSERT [dbo].[Proveedores] OFF
GO
ALTER TABLE [dbo].[Pedidos]  WITH CHECK ADD FOREIGN KEY([Id_Cliente])
REFERENCES [dbo].[Cliente] ([Id_Cliente])
GO
ALTER TABLE [dbo].[Pedidos]  WITH CHECK ADD FOREIGN KEY([Id_Empleado])
REFERENCES [dbo].[Empleados] ([Id_Empleado])
GO
ALTER TABLE [dbo].[Pedidos]  WITH CHECK ADD FOREIGN KEY([Id_Producto])
REFERENCES [dbo].[Productos_Farmaceuticos] ([Id_Producto])
GO
ALTER TABLE [dbo].[Productos_Farmaceuticos]  WITH CHECK ADD FOREIGN KEY([Id_Proveedor])
REFERENCES [dbo].[Proveedores] ([Id_Proveedor])
GO
USE [master]
GO
ALTER DATABASE [Farmacia] SET  READ_WRITE 
GO
