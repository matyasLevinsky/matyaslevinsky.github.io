local badges = {
  author     = { text = "author",     cls = "text-bg-success" },
  ["second author"] = { text = "second author", cls = "text-bg-info" },
  data       = { text = "data",       cls = "text-bg-warning" },
  literature = { text = "literature", cls = "text-bg-danger"  },
}

return {
  ["badge"] = function(args)
    local key = pandoc.utils.stringify(args[1])
    local b = badges[key]
    if b then
      return pandoc.RawInline("html",
        '<span class="badge ' .. b.cls .. ' rounded-pill">' .. b.text .. '</span>')
    end
    return pandoc.Str("[unknown badge: " .. key .. "]")
  end
}
