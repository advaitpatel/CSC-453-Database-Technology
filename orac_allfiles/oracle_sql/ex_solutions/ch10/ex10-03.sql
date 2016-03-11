--clean up
DROP TABLE members_groups;
DROP TABLE members;
DROP TABLE groups;

CREATE TABLE members 
(
  member_id     NUMBER              NOT NULL, 
  first_name    VARCHAR2(50)   NOT NULL, 
  last_name     VARCHAR2(50)   NOT NULL, 
  address       VARCHAR2(50)   NOT NULL, 
  city          VARCHAR2(25)   NOT NULL, 
  state         CHAR(2)        DEFAULT 'CA', 
  phone         VARCHAR2(20),
  CONSTRAINT members_pk PRIMARY KEY (member_id)
);

CREATE TABLE groups 
(
  group_id      NUMBER              NOT NULL, 
  group_name    VARCHAR2(50 BYTE)   NOT NULL, 
  CONSTRAINT groups_pk PRIMARY KEY (group_id)
);

CREATE TABLE members_groups
(
  member_id     NUMBER              NOT NULL, 
  group_id      NUMBER              NOT NULL,
  CONSTRAINT members_groups_fk_members FOREIGN KEY (member_id)
    REFERENCES members (member_id), 
  CONSTRAINT members_groups_fk_groups FOREIGN KEY (group_id)
	  REFERENCES groups (group_id)
);

