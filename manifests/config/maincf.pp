define postfix::config::maincf(
  $ensure = present,
  $value=undef,
) {
  Augeas {
    context => "/files/etc/postfix/main.cf",
    notify  => Class['postfix'],
  }

  case $ensure {
    present: {
      if !$value {
        fail("postfix main.cf ${name} value not set")
      }
      augeas { "postfix main.cf ${name}":
        changes => "set $name '$value'",
      }
    }

    absent: {
      augeas { "postfix main.cf ${name}":
        changes => "rm $name",
      }
    }
  }
}
