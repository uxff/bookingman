

CREATE TABLE `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '用户姓名',
  `email` varchar(32) NOT NULL COMMENT '邮箱',
  `phone` varchar(12) NOT NULL DEFAULT '' COMMENT '手机号 ',
  `pwd` varchar(32) NOT NULL DEFAULT '' COMMENT '密码',
  `levelId` int(11) NOT NULL DEFAULT '0' COMMENT '级别id',
  `totalCharge` int(11) NOT NULL DEFAULT '0' COMMENT '累计充值 单位分',
  `quataSpace` bigint(20) NOT NULL DEFAULT '0' COMMENT '当前拥有的空间 单位KB',
  `usedSpace` bigint(20) NOT NULL DEFAULT '0' COMMENT '当前已用空间 单位KB',
  `fileCount` bigint(20) NOT NULL DEFAULT '0' COMMENT '文件数量',
  `lastLoginAt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最后登录时间',
  `lastLoginIp` varchar(16) NOT NULL DEFAULT '' COMMENT '最后登录ip',
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态 1=正常启用 99=账户冻结 ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `user_level` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '会员级别id',
  `name` varchar(32) NOT NULL COMMENT '会员级别名称',
  `quotaSpace` bigint(20) NOT NULL DEFAULT '0' COMMENT '会员级别的用户空间 单位KB',
  `price` int(11) NOT NULL DEFAULT '0' COMMENT '会员级别的价格 单位分',
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态 1=启用 99=删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `manager` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '管理员id',
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '管理员名称',
  `phone` varchar(12) NOT NULL DEFAULT '' COMMENT '管理员手机号',
  `email` varchar(32) NOT NULL DEFAULT '' COMMENT '管理员email',
  `pwd` varchar(32) NOT NULL DEFAULT '' COMMENT '密码',
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态 1=正常 99=删除',
  `roleId` int(11) NOT NULL DEFAULT '0' COMMENT '角色id',
  `isSuper` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否是超管 1=超管',
  `lastLoginAt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最后登录时间',
  `lastLoginIp` varchar(16) NOT NULL DEFAULT '' COMMENT '最后登录ip',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `oper_log` (
  `id` int(11) NOT NULL COMMENT '操作记录id',
  `managerId` int(11) NOT NULL COMMENT '操作员id 对应员工id',
  `managerName` varchar(32) NOT NULL DEFAULT '' COMMENT '操作人名称',
  `operBiz` varchar(64) NOT NULL COMMENT '操作业务 枚举',
  `operParams` text NOT NULL COMMENT '操作内容参数',
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '操作时间',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态 1=正常',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `userId` int(11) NOT NULL COMMENT '用户id',
  `originLevelId` int(11) NOT NULL COMMENT '用户原等级id',
  `awardLevelId` int(11) NOT NULL DEFAULT '0' COMMENT '用户购买的等级id',
  `awardSpace` bigint(11) NOT NULL DEFAULT '0' COMMENT '本次购买的容量空间 单位KB',
  `phone` varchar(12) NOT NULL DEFAULT '' COMMENT '用户手机号',
  `levelName` varchar(12) NOT NULL DEFAULT '' COMMENT '等级名',
  `totalAmount` int(11) NOT NULL DEFAULT '0' COMMENT '订单价格 单位分',
  `payAmount` int(11) NOT NULL DEFAULT '0' COMMENT '实付款金额 单位分',
  `remark` text NOT NULL COMMENT '订单备注',
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态 1=待付款 2=未付款关闭 3=已付款 4=已退款',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '角色名称',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态 1=正常启用 99=删除',
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `permit` text NOT NULL COMMENT '授权内容 json',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `node` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `nodeName` varchar(16) NOT NULL COMMENT '节点号',
  `totalSpace` int(11) NOT NULL DEFAULT '0' COMMENT '全部空间 单位KB',
  `usedSpace` int(11) NOT NULL DEFAULT '0' COMMENT '使用的空间 单位KB',
  `remark` text NOT NULL COMMENT '房间备注',
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '添加时间',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态 1=正常启用 99=删除 ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- todo 分库分表 by hash
CREATE TABLE `file_index` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文件id',
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '文件名',
  `hash` varchar(32) NOT NULL DEFAULT '' COMMENT '文件哈希',
  `nodeId` int(11) NOT NULL DEFAULT '0' COMMENT '所在节点名 第一副本所在节点',
  `nodeId2` int(11) NOT NULL DEFAULT '0' COMMENT '所在节点名 第二副本所在节点',
  `nodeId3` int(11) NOT NULL DEFAULT '0' COMMENT '所在节点名 第三副本所在节点',
  `path` varchar(256) NOT NULL DEFAULT '' COMMENT '文件文件',
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态 0=未就绪 1=就绪 98=上传失败 99=删除',
  `referCount` int(11) NOT NULL DEFAULT '0' COMMENT '被引用数量',
  `size` int(11) NOT NULL DEFAULT '0' COMMENT '大小 单位Byte',
  `space` int(11) NOT NULL DEFAULT '0' COMMENT '占用空间单位 单位KB',
  `desc` text NOT NULL COMMENT '描述信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- todo 分库分表 by uid
CREATE TABLE `user_file` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文件id',
  `user_id` varchar(32) NOT NULL DEFAULT '' COMMENT '文件名',
  `fileHash` varchar(32) NOT NULL DEFAULT '' COMMENT '文件哈希',
  `path` varchar(256) NOT NULL DEFAULT '' COMMENT '文件路径',
  `fileName` varchar(256) NOT NULL DEFAULT '' COMMENT '文件名',
  `nodeId` int(11) NOT NULL DEFAULT '0' COMMENT '所在节点名 第一副本所在节点',
  `path` varchar(256) NOT NULL DEFAULT '' COMMENT '文件文件',
  `isDir` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否是目录',
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态 1=正常 2=隐藏 99=下架',
  `size` int(11) NOT NULL DEFAULT '0' COMMENT '大小 单位Byte',
  `space` int(11) NOT NULL DEFAULT '0' COMMENT '占用空间单位 单位KB',
  `desc` text NOT NULL COMMENT '描述信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `share` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文件id',
  `fileHash` varchar(32) NOT NULL DEFAULT '' COMMENT '文件哈希',
  `userId` int(11) NOT NULL DEFAULT '0' COMMENT '分享者用户id',
  `nodeId` int(11) NOT NULL DEFAULT '0' COMMENT '所在节点名',
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '文件名',
  `path` varchar(256) NOT NULL DEFAULT '' COMMENT '文件文件',
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态 1=正常 2=隐藏 99=已删除',
  `expired` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '分享有效期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

