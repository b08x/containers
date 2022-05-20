settings {
    logfile = "/root/.config/lsyncd/lsyncd.log",
    statusFile = "/root/.config/lsyncd/lsyncd.status",
    insist = true
}

sync {
    default.rsyncssh,
    source = "/home/b08x",
    host = "lapbot",
    targetdir = "/home/b08x",
    excludeFrom = "/home/b08x/exclude_home.list",
    delay = 5,
    rsync = {
            verbose = true,
            inplace = true,
            _extra = {
                    "--stats",
                    "--delete-before",
                    "--backup-dir=.backup",
                    "--suffix=_bak",
                    "--info=progress2",
		    "--group",
		    "--owner"
            }
    },
    ssh = {
            identityFile = "/root/.ssh/id_rsa",
            options = {
                    User = "root",
                    StrictHostKeyChecking = "no",
                    Compression = "no",
                    Cipher = "aes256-gcm@openssh.com"
            },
            _extra = {
                    "-T",
                    "-c",
                    "aes256-gcm@openssh.com"
            }
    }
}
