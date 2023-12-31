PGDMP         0             	    {           prueba5    14.9    14.9 &    !           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            "           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            #           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            $           1262    16561    prueba5    DATABASE     c   CREATE DATABASE prueba5 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Spanish_Spain.1252';
    DROP DATABASE prueba5;
                postgres    false            �            1259    16574 
   categorias    TABLE     k   CREATE TABLE public.categorias (
    categoriaid integer NOT NULL,
    nombrecat character(50) NOT NULL
);
    DROP TABLE public.categorias;
       public         heap    postgres    false            �            1259    16579    clientes    TABLE     E  CREATE TABLE public.clientes (
    clienteid integer NOT NULL,
    cedula_ruc character(10) NOT NULL,
    nombrecia character(30) NOT NULL,
    nombrecontacto character(50) NOT NULL,
    direccioncli character(50) NOT NULL,
    fax character(12),
    email character(50),
    celular character(12),
    fijo character(12)
);
    DROP TABLE public.clientes;
       public         heap    postgres    false            �            1259    16589    detalle_ordenes    TABLE     �   CREATE TABLE public.detalle_ordenes (
    ordenid integer NOT NULL,
    detalleid integer NOT NULL,
    productoid integer NOT NULL,
    cantidad integer NOT NULL
);
 #   DROP TABLE public.detalle_ordenes;
       public         heap    postgres    false            �            1259    16563 	   empleados    TABLE     �   CREATE TABLE public.empleados (
    empleadoid integer NOT NULL,
    nombre character(30),
    apellido character(30),
    fecha_nac date,
    reporta_a integer,
    extension integer
);
    DROP TABLE public.empleados;
       public         heap    postgres    false            �            1259    16562    empleados_empleadoid_seq    SEQUENCE     �   CREATE SEQUENCE public.empleados_empleadoid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.empleados_empleadoid_seq;
       public          postgres    false    210            %           0    0    empleados_empleadoid_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.empleados_empleadoid_seq OWNED BY public.empleados.empleadoid;
          public          postgres    false    209            �            1259    16584    ordenes    TABLE     �   CREATE TABLE public.ordenes (
    ordenid integer NOT NULL,
    empleadoid integer NOT NULL,
    clienteid integer NOT NULL,
    fechaorden date NOT NULL,
    descuento integer
);
    DROP TABLE public.ordenes;
       public         heap    postgres    false            �            1259    16594 	   productos    TABLE     �   CREATE TABLE public.productos (
    productoid integer NOT NULL,
    proveedorid integer NOT NULL,
    categoriaid integer NOT NULL,
    descripcion character(50),
    preciounit numeric NOT NULL,
    existencia integer NOT NULL
);
    DROP TABLE public.productos;
       public         heap    postgres    false            �            1259    16569    proveedores    TABLE     �   CREATE TABLE public.proveedores (
    proveedorid integer NOT NULL,
    nombreprov character(50) NOT NULL,
    contacto character(50) NOT NULL,
    celuprov character(12),
    fijoprov character(12)
);
    DROP TABLE public.proveedores;
       public         heap    postgres    false            �            1259    16636    proveedores_proveedorid_seq    SEQUENCE     �   CREATE SEQUENCE public.proveedores_proveedorid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.proveedores_proveedorid_seq;
       public          postgres    false            u           2604    16566    empleados empleadoid    DEFAULT     |   ALTER TABLE ONLY public.empleados ALTER COLUMN empleadoid SET DEFAULT nextval('public.empleados_empleadoid_seq'::regclass);
 C   ALTER TABLE public.empleados ALTER COLUMN empleadoid DROP DEFAULT;
       public          postgres    false    209    210    210                      0    16574 
   categorias 
   TABLE DATA           <   COPY public.categorias (categoriaid, nombrecat) FROM stdin;
    public          postgres    false    212   �/                 0    16579    clientes 
   TABLE DATA           }   COPY public.clientes (clienteid, cedula_ruc, nombrecia, nombrecontacto, direccioncli, fax, email, celular, fijo) FROM stdin;
    public          postgres    false    213   >0                 0    16589    detalle_ordenes 
   TABLE DATA           S   COPY public.detalle_ordenes (ordenid, detalleid, productoid, cantidad) FROM stdin;
    public          postgres    false    215   �1                 0    16563 	   empleados 
   TABLE DATA           b   COPY public.empleados (empleadoid, nombre, apellido, fecha_nac, reporta_a, extension) FROM stdin;
    public          postgres    false    210   B2                 0    16584    ordenes 
   TABLE DATA           X   COPY public.ordenes (ordenid, empleadoid, clienteid, fechaorden, descuento) FROM stdin;
    public          postgres    false    214   >3                 0    16594 	   productos 
   TABLE DATA           n   COPY public.productos (productoid, proveedorid, categoriaid, descripcion, preciounit, existencia) FROM stdin;
    public          postgres    false    216   �3                 0    16569    proveedores 
   TABLE DATA           \   COPY public.proveedores (proveedorid, nombreprov, contacto, celuprov, fijoprov) FROM stdin;
    public          postgres    false    211   �4       &           0    0    empleados_empleadoid_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.empleados_empleadoid_seq', 10, true);
          public          postgres    false    209            '           0    0    proveedores_proveedorid_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.proveedores_proveedorid_seq', 1, false);
          public          postgres    false    217            {           2606    16578    categorias pk_categorias 
   CONSTRAINT     _   ALTER TABLE ONLY public.categorias
    ADD CONSTRAINT pk_categorias PRIMARY KEY (categoriaid);
 B   ALTER TABLE ONLY public.categorias DROP CONSTRAINT pk_categorias;
       public            postgres    false    212            }           2606    16583    clientes pk_clientes 
   CONSTRAINT     Y   ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT pk_clientes PRIMARY KEY (clienteid);
 >   ALTER TABLE ONLY public.clientes DROP CONSTRAINT pk_clientes;
       public            postgres    false    213            �           2606    16593 "   detalle_ordenes pk_detalle_ordenes 
   CONSTRAINT     p   ALTER TABLE ONLY public.detalle_ordenes
    ADD CONSTRAINT pk_detalle_ordenes PRIMARY KEY (ordenid, detalleid);
 L   ALTER TABLE ONLY public.detalle_ordenes DROP CONSTRAINT pk_detalle_ordenes;
       public            postgres    false    215    215            w           2606    16568    empleados pk_empleados 
   CONSTRAINT     \   ALTER TABLE ONLY public.empleados
    ADD CONSTRAINT pk_empleados PRIMARY KEY (empleadoid);
 @   ALTER TABLE ONLY public.empleados DROP CONSTRAINT pk_empleados;
       public            postgres    false    210                       2606    16588    ordenes pk_ordenes 
   CONSTRAINT     U   ALTER TABLE ONLY public.ordenes
    ADD CONSTRAINT pk_ordenes PRIMARY KEY (ordenid);
 <   ALTER TABLE ONLY public.ordenes DROP CONSTRAINT pk_ordenes;
       public            postgres    false    214            �           2606    16600    productos pk_productos 
   CONSTRAINT     \   ALTER TABLE ONLY public.productos
    ADD CONSTRAINT pk_productos PRIMARY KEY (productoid);
 @   ALTER TABLE ONLY public.productos DROP CONSTRAINT pk_productos;
       public            postgres    false    216            y           2606    16573    proveedores pk_proveedores 
   CONSTRAINT     a   ALTER TABLE ONLY public.proveedores
    ADD CONSTRAINT pk_proveedores PRIMARY KEY (proveedorid);
 D   ALTER TABLE ONLY public.proveedores DROP CONSTRAINT pk_proveedores;
       public            postgres    false    211            �           2606    16611 -   detalle_ordenes fk_detalle__orden_det_ordenes    FK CONSTRAINT     �   ALTER TABLE ONLY public.detalle_ordenes
    ADD CONSTRAINT fk_detalle__orden_det_ordenes FOREIGN KEY (ordenid) REFERENCES public.ordenes(ordenid) ON UPDATE RESTRICT ON DELETE RESTRICT;
 W   ALTER TABLE ONLY public.detalle_ordenes DROP CONSTRAINT fk_detalle__orden_det_ordenes;
       public          postgres    false    214    215    3199            �           2606    16616 .   detalle_ordenes fk_detalle__prod_deta_producto    FK CONSTRAINT     �   ALTER TABLE ONLY public.detalle_ordenes
    ADD CONSTRAINT fk_detalle__prod_deta_producto FOREIGN KEY (productoid) REFERENCES public.productos(productoid) ON UPDATE RESTRICT ON DELETE RESTRICT;
 X   ALTER TABLE ONLY public.detalle_ordenes DROP CONSTRAINT fk_detalle__prod_deta_producto;
       public          postgres    false    3203    216    215            �           2606    16631    empleados fk_empleado_reporta    FK CONSTRAINT     �   ALTER TABLE ONLY public.empleados
    ADD CONSTRAINT fk_empleado_reporta FOREIGN KEY (reporta_a) REFERENCES public.empleados(empleadoid) ON UPDATE RESTRICT ON DELETE RESTRICT;
 G   ALTER TABLE ONLY public.empleados DROP CONSTRAINT fk_empleado_reporta;
       public          postgres    false    3191    210    210            �           2606    16601 %   ordenes fk_ordenes_clien_ord_clientes    FK CONSTRAINT     �   ALTER TABLE ONLY public.ordenes
    ADD CONSTRAINT fk_ordenes_clien_ord_clientes FOREIGN KEY (clienteid) REFERENCES public.clientes(clienteid) ON UPDATE RESTRICT ON DELETE RESTRICT;
 O   ALTER TABLE ONLY public.ordenes DROP CONSTRAINT fk_ordenes_clien_ord_clientes;
       public          postgres    false    214    213    3197            �           2606    16606 %   ordenes fk_ordenes_emple_ord_empleado    FK CONSTRAINT     �   ALTER TABLE ONLY public.ordenes
    ADD CONSTRAINT fk_ordenes_emple_ord_empleado FOREIGN KEY (empleadoid) REFERENCES public.empleados(empleadoid) ON UPDATE RESTRICT ON DELETE RESTRICT;
 O   ALTER TABLE ONLY public.ordenes DROP CONSTRAINT fk_ordenes_emple_ord_empleado;
       public          postgres    false    210    214    3191            �           2606    16621 (   productos fk_producto_cate_prod_categori    FK CONSTRAINT     �   ALTER TABLE ONLY public.productos
    ADD CONSTRAINT fk_producto_cate_prod_categori FOREIGN KEY (categoriaid) REFERENCES public.categorias(categoriaid) ON UPDATE RESTRICT ON DELETE RESTRICT;
 R   ALTER TABLE ONLY public.productos DROP CONSTRAINT fk_producto_cate_prod_categori;
       public          postgres    false    212    3195    216            �           2606    16626 (   productos fk_producto_prov_prod_proveedo    FK CONSTRAINT     �   ALTER TABLE ONLY public.productos
    ADD CONSTRAINT fk_producto_prov_prod_proveedo FOREIGN KEY (proveedorid) REFERENCES public.proveedores(proveedorid) ON UPDATE RESTRICT ON DELETE RESTRICT;
 R   ALTER TABLE ONLY public.productos DROP CONSTRAINT fk_producto_prov_prod_proveedo;
       public          postgres    false    3193    211    216               l   x����� г[��7�F7� ���!t s��LZ��	���sa)s�R�T&6�����n�ı
�whZ�V��SH�τ�^���s
�E~$�2� ?M�;�         �  x����j�0��է�'m}�TQ\�8(�`�����zȘGEȕd��KT�k�������'n�K���)FT��ӂ���ȿ0 ?���98��\��oSCU{g�ao-PT����Z�#Tm�x=e�NNC�g�������g,tA�
��ĨF�a�;F�j�\�&%B&�ȅ��t{�5�k�sg�h���	#6Q���R�Uov��}�ۋrϾ��=�b5ES<�t�3�m���7=���u�{�+胸�S��k� {�CR����vV�b��s�=iGS�Н� �,*�J<ӱ��.�:���A�ټ�u�=��tWw�(sb�b!�n�9�zi<�y���uБ�K�~��Il�\���l�o�{k��OdٵO[���6�1���c�&�ҍ��w�n6�/%�         [   x�=���0C��0U �]����"�-x�@���hi�8ڰ��yѓ����
Sji�P���h2�3.��8�ˇ�It�K�tg��o�:߇�J�         �   x���MN�0��3��y��N�nbAPpP���a�E��H$����8�w��?3<�|܈�q������Wp����?v�l�|l���]M�$(�]h`�!v�����z	�Z��MjS`�~�g:lB�.��@&]���:,���c�c;�6d��TI\&`U+�k��-qJŁI#+tK(�Ύ8l����4�@�X���|9~����W�3�� +����v�N����}�tx@�? (r.         \   x�Uͻ�0�Z�%9��%2���#8qǽ�����D��~����
����Έ�'��H��&��~4�����m#V-�l��9
U����]7�[�>           x������ �3<O`@���HIŀ�m�ɾ�st��m��b8x�/�ϯ���$���d�Q<�YL���?VW�d����@�[q3f<?�&!!MFF\q  ­�amu��%��}�ơm�ܙCq�w�KFf�I�|F�}�w*i��[X���!mE����l8�'#����P鮃�=��sJa�`���F�Ȑ��d�7*Y�(�S�ɺT0D�_�u�S���a�TV�����W9*�!bW"�1�p��$e��T���%��         %  x���Qn� �g<'h��q�����M����(�I_L��O����Al��Ύ��^l°Z�1��-Z�ԍT����e���T5��b�҈늁ϖ�x	dA#e6�$4�����	�F�{rKit�� �M���G��b��XB&t����	Ruژ������\l�E>��@_VF"�V}��@�F��ӎ<C�bpi���cat{Yp�ЦP��l�У?E����\Fyw�"�W�u� �t$�+��Y�������[���`������ D�9�C������[UU����     