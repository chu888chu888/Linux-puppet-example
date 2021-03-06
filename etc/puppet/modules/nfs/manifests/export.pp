define nfs::export($client) {
    augeas {
		"nfs_export_${name}":
			context => "/files/etc/exports",
			changes => [
				"set dir[.= '$name'] ${name}",
				"set dir[.= '$name']/client ${client}",
				"set dir[.= '$name']/client/option[1] ro",
				"set dir[.= '$name']/client/option[2] all_squash"
			],
			notify => Service["rpcbind"],
	}
}
