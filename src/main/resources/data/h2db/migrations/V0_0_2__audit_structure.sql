CREATE TABLE `user` (
  `id` bigint(20) PRIMARY KEY AUTO_INCREMENT,
  `created_by` varchar(255) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_modified_by` varchar(255) NOT NULL,
  `last_modified_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isAccountNonExpired` bit(1) DEFAULT NULL,
  `isAccountNonLocked` bit(1) DEFAULT NULL,
  `isCredentialsNonExpired` bit(1) DEFAULT NULL,
  `isEnabled` bit(1) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL UNIQUE
);

CREATE TABLE `permission` (
  `id` bigint(20) PRIMARY KEY AUTO_INCREMENT,
  `created_by` varchar(255) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_modified_by` varchar(255) NOT NULL,
  `last_modified_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `name` varchar(255) DEFAULT NULL
);

CREATE TABLE `role` (
  `id` bigint(20) PRIMARY KEY AUTO_INCREMENT,
  `created_by` varchar(255) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_modified_by` varchar(255) NOT NULL,
  `last_modified_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `name` varchar(255) DEFAULT NULL
);

create table permission_role (
role_id bigint not null,
permission_id bigint not null
);

ALTER TABLE permission_role ADD FOREIGN KEY (permission_id) REFERENCES permission(id);
ALTER TABLE permission_role ADD FOREIGN KEY (role_id) REFERENCES role(id);

create table role_user (
user_id bigint not null,
role_id bigint not null
);

ALTER TABLE role_user ADD FOREIGN KEY (user_id) REFERENCES permission(id);
ALTER TABLE role_user ADD FOREIGN KEY (role_id) REFERENCES role(id);
