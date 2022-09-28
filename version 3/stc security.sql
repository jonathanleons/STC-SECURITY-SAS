create table tipo_documento(
id_tipo int primary key auto_increment,
nombre varchar (30)
);
create table roles(
id_roles int primary key auto_increment,
nombre varchar (30)
);
create table genero(
id_genero int primary key auto_increment,
nombre varchar (30)
);
create table sistema_monitoreo(
id_sistema int primary key auto_increment,
nombre varchar (40),
descripcion varchar (200)
);
create table productos(
id_producto int primary key auto_increment,
nombre varchar (40),
tipo varchar (40),
precio double,
descripcion varchar (200),
cantidad int,
estado varchar (50)
);
create table combos(
id_combos int primary key auto_increment,
id_producto int,
id_sistema int,
descripcion varchar (200),
foreign key (id_producto) references productos(id_producto),
foreign key (id_sistema) references sistema_monitoreo(id_sistema)
);
create table usuarios(
id_usuarios int primary key auto_increment,
nombres varchar (40),
apellidos varchar (40),
id_genero int,
id_roles int,
correo varchar (40),
contraseña varchar (40),
edad date,
id_tipo int,
documento varchar (40),
foreign key (id_genero) references genero(id_genero),
foreign key (id_tipo) references tipo_documento(id_tipo),
foreign key (id_roles) references roles (id_roles)
);
create table contrato (
id_contrato int primary key auto_increment,
id_usuario int,
nombre varchar (40),
documento varchar (40),
id_producto int,
id_combos int,
fecha_inicio date,
fecha_fin date,
descripcion varchar(1000),
foreign key (id_usuario) references usuarios(id_usuarios),
foreign key (id_producto) references productos(id_producto),
foreign key (id_combos) references combos(id_combos)
);
create table gestion_instalacion(
id_gestion int primary key auto_increment,
id_usuario int,
fecha_instalacion date,
observacion varchar (500),
foreign key (id_usuario) references usuarios(id_usuarios)
);
create table pedidos (
id_pedido int primary key auto_increment,
id_usuario int,
nombre varchar (40),
direccion varchar (40),
ciudad varchar(40),
telefono varchar (40),
id_productos int,
id_combos int,
fecha_entrega date,
foreign key (id_usuario) references usuarios(id_usuarios),
foreign key (id_productos) references productos(id_producto),
foreign key (id_combos) references combos(id_combos)
);

