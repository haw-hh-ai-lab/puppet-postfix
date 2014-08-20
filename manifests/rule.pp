#
# define an additional rule to the postfix main.cf file
#
#  will add a line to the config file of <rule-name> = <rule>
#
define postfix::rule (
  $rule,
){
    postfix::config::maincfhelper { $name: value => $rule }
}