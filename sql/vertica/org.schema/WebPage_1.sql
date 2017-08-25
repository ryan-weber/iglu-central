CREATE TABLE IF NOT EXISTS atomic.org_schema_WebPage_1 (
	-- Schema of this type
	schema_vendor		varchar(128)		not null		encoding rle,
	schema_name 		varchar(128)		not null		encoding rle,
	schema_format		varchar(128)		not null		encoding rle,
	schema_version		varchar(128)		not null		encoding rle,
	-- Parentage of this type
	root_id     		varchar(36) 		not null		encoding gzip_comp   ,
	root_tstamp 		timestamp   		not null		encoding deltaval    ,
	ref_root    		varchar(255)		not null		encoding rle         ,
	ref_tree    		varchar(1500)		not null		encoding rle         ,
	ref_parent  		varchar(255)		not null		encoding rle         ,
	-- Properties of this type
	breadcrumb  		varchar(4096)		null        		encoding gzip_comp   ,
	genre       		varchar(255)		null        		encoding gzip_comp   ,
	author      		varchar(255)		null        		encoding gzip_comp   ,
	dateCreated 		varchar(255)		null        		encoding gzip_comp   ,
	dateModified		varchar(255)		null        		encoding gzip_comp   ,
	datePublished		varchar(255)		null        		encoding gzip_comp   ,
	inLanguage  		varchar(255)		null        		encoding gzip_comp   ,
	keywords    		varchar(4096)		null        		encoding gzip_comp   
)
ORDER BY
	schema_vendor,
	schema_name,
	schema_format,
	schema_version,
	ref_root,
	ref_tree,
	ref_parent,
	root_tstamp,
	root_id
SEGMENTED BY
	hash(root_id) ALL NODES
;