 def lib_nav_active(route, current_path)
    text = route
    route = '/' if route == "home"
    "<li nowrap><a href=\"#{route}\"#{' class="active"' if route.gsub('-', ' ') == current_path.gsub('-', ' ')}>#{text.gsub('-', ' ').split(/\s+/).each{ |word| word.capitalize! }.join(' ') }</a></li>"
  end