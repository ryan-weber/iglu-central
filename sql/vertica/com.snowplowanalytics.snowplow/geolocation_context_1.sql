-- Copyright (c) 2014 Snowplow Analytics Ltd. All rights reserved.
--
-- This program is licensed to you under the Apache License Version 2.0,
-- and you may not use this file except in compliance with the Apache License Version 2.0.
-- You may obtain a copy of the Apache License Version 2.0 at http://www.apache.org/licenses/LICENSE-2.0.
--
-- Unless required by applicable law or agreed to in writing,
-- software distributed under the Apache License Version 2.0 is distributed on an
-- "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the Apache License Version 2.0 for the specific language governing permissions and limitations there under.
--
-- Authors:       Alex Dean
-- Copyright:     Copyright (c) 2014 Snowplow Analytics Ltd
-- License:       Apache License Version 2.0
--
-- Compatibility: iglu:com.snowplowanalytics.snowplow/geolocation_context/jsonschema/1-0-0

CREATE TABLE atomic.com_snowplowanalytics_snowplow_geolocation_context_1 (
	-- Schema of this type
	"schema.vendor"  			varchar(128)		not null	encoding rle,
	"schema.name"    			varchar(128)		not null	encoding rle,
	"schema.format"  			varchar(128)		not null	encoding rle,
	"schema.version" 			varchar(128)		not null	encoding rle,
	-- Parentage of this type
	"hierarchy.rootId"        	char(36)     		not null	encoding gzip_comp,
	"hierarchy.rootTstamp"    	timestamp    		not null	encoding deltaval,
	"hierarchy.refRoot"       	varchar(255) 		not null	encoding rle,
	"hierarchy.refTree"       	varchar(1500)		not null	encoding rle,
	"hierarchy.refParent"     	varchar(255) 		not null	encoding rle,
	-- Properties of this type
	"data.latitude"                    float not null,
	"data.longitude"                   float not null,
	"data.latitude_longitude_accuracy" float,
	"data.altitude"                    float,
	"data.altitude_accuracy"           float,
	"data.bearing"                     float,
	"data.speed"                       float,
	FOREIGN KEY("hierarchy.rootId") REFERENCES atomic.events(event_id)
)
ORDER BY
	"schema.vendor",
	"schema.name",
	"schema.format",
	"schema.version",
	"hierarchy.refRoot",
	"hierarchy.refTree",
	"hierarchy.refParent",
	"hierarchy.rootTstamp",
	"hierarchy.rootId"
SEGMENTED BY 
	hash("hierarchy.rootId") ALL NODES
;

