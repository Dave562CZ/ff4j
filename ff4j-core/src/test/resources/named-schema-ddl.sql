-- #%L
-- ff4j-core
-- %%
-- Copyright (C) 2013 - 2020 FF4J
-- %%
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
-- 
--      http://www.apache.org/licenses/LICENSE-2.0
-- 
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.
-- #L%CREATE SCHEMA FF4J;

-- Main Table to store Features
CREATE TABLE FF4J.FF4J_FEATURES (
  "FEAT_UID"     	VARCHAR(100),
  "ENABLE"  		INTEGER NOT NULL,
  "DESCRIPTION" 	VARCHAR(1000),
  "STRATEGY"		VARCHAR(1000),
  "EXPRESSION"	    VARCHAR(255),
  "GROUPNAME"		VARCHAR(100),
  PRIMARY KEY("FEAT_UID")
);

-- Roles to store ACL, FK to main table
CREATE TABLE FF4J.FF4J_ROLES (
  "FEAT_UID"     VARCHAR(100) REFERENCES FF4J_FEATURES("FEAT_UID"),
  "ROLE_NAME"    VARCHAR(100),
  PRIMARY KEY("FEAT_UID", "ROLE_NAME")
);

-- Feature Internal Custom Properties
CREATE TABLE FF4J.FF4J_CUSTOM_PROPERTIES (
  "PROPERTY_ID"  VARCHAR(100) NOT NULL,
  "CLAZZ" 		 VARCHAR(255) NOT NULL,
  "CURRENTVALUE" VARCHAR(255),
  "FIXEDVALUES"	 VARCHAR(1000),
  "DESCRIPTION"	 VARCHAR(1000),
  "FEAT_UID"     VARCHAR(100) REFERENCES FF4J_FEATURES("FEAT_UID"),
  PRIMARY KEY("PROPERTY_ID", "FEAT_UID")
);

-- @PropertyStore (edit general properties)
CREATE TABLE FF4J.FF4J_PROPERTIES (
  "PROPERTY_ID"  VARCHAR(100) NOT NULL,
  "CLAZZ" 		 VARCHAR(255) NOT NULL,
  "CURRENTVALUE" VARCHAR(255),
  "FIXEDVALUES"	 VARCHAR(1000),
  "DESCRIPTION"	 VARCHAR(1000),
  PRIMARY KEY("PROPERTY_ID")
);

-- @see JdbcEventRepository (audit event)
CREATE TABLE FF4J.FF4J_AUDIT (
  "EVT_UUID" 	 VARCHAR(40)  NOT NULL,
  "EVT_TIME" 	 TIMESTAMP 	  NOT NULL,
  "EVT_TYPE" 	 VARCHAR(30)  NOT NULL,
  "EVT_NAME" 	 VARCHAR(100)  NOT NULL,
  "EVT_ACTION" 	 VARCHAR(100)  NOT NULL,
  "EVT_HOSTNAME" VARCHAR(100)  NOT NULL,
  "EVT_SOURCE" 	 VARCHAR(30)  NOT NULL,
  "EVT_DURATION" INTEGER,
  "EVT_USER" 	 VARCHAR(30),
  "EVT_VALUE" 	 VARCHAR(100),
  "EVT_KEYS" 	 VARCHAR(255),
  PRIMARY KEY("EVT_UUID", "EVT_TIME")
);

