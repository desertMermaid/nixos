let carapace_completer = {|spans|
  carapace $spans.0 nushell ...$spans | from json
}
$env.config = {
  show_banner: false,
  completions: {
    case_sensitive: false
    quick: true
    partial: true
    algorithm: "fuzzy"
    external: {
      enable: true
      max_results: 100
      completer: $carapace_completer
    }
  }
}
# PATH is already set correctly by nix-darwin
# If you need to add custom paths, use prepend/append like this:
# $env.PATH = ($env.PATH | split row (char esep) | prepend /your/custom/path)

def start_zellij [] {
  if 'ZELLIJ' not-in ($env | columns) {
    if 'ZELLIJ_AUTO_ATTACH' in ($env | columns) and $env.ZELLIJ_AUTO_ATTACH == 'true' {
      zellij attach -c
    } else {
      zellij
    }

    if 'ZELLIJ_AUTO_EXIT' in ($env | columns) and $env.ZELLIJ_AUTO_EXIT == 'true' {
      exit
    }
  }
}

start_zellij
