vault {
 address = "http://vault.default.svc.cluster.local:8200"
 unwrap_token = false
 renew_token = false

  ssl {
    enabled = false
    verify  = false
  }
}

upcase = true

exec {
  command = "/bin/sh"

  env {
    pristine = false
  }
}

secret {
  no_prefix = true
  path="bla"
}
