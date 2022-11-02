# Sublime Text 3 setup

My latest settings:

```
{
  "auto_complete_commit_on_tab": true,
  "auto_match_enabled": false,
  "binary_file_patterns":
  [
    "*.log",
    "priv/static/",
    "node_modules/",
    "deps/",
    "_files*",
    "_site/",
    "_debug/",
    "tmp/",
    "test/reports/",
    "public/packs/",
    "scratch.ignore/",
    "export/",
    "public/uploads/"
  ],
  "color_scheme": "Packages/Color Scheme - Default/Monokai.sublime-color-scheme",
  "detect_indentation": false,
  "ensure_newline_at_eof_on_save": true,
  "file_exclude_patterns":
  [
    "*.xmlz",
    ".DS_Store",
    "*.map",
    ".keep",
    ".byebug_history"
  ],
  "folder_exclude_patterns":
  [
    ".git",
    "_build",
    "_files.ignore",
    "coverage"
  ],
  "font_size": 14,
  "hot_exit": false,
  "ignored_packages":
  [
    "Vintage"
  ],
  "margin": 0,
  "rulers":
  [
    90
  ],
  "save_on_focus_lost": false,
  "show_definitions": false,
  "tab_size": 2,
  "theme": "Adaptive.sublime-theme",
  "translate_tabs_to_spaces": true,
  "trim_trailing_white_space_on_save": true,
  "update_check": false,
  "word_wrap": true
}
```

Keymaps:

```
[
  { "keys": ["super+back_slash"], "command": "toggle_side_bar" }
]
```

Latest installed packages:

```
{
  "bootstrapped": true,
  "in_process_packages":
  [
  ],
  "installed_packages":
  [
    "Elixir Syntax (?) ",
    "HTMLBeautify",
    "JSX",
    "Monokai Dark",
    "Package Control",
    "SCSS",
    "SideBarTools"
  ]
}
```


## Configured files & snippets

```
# Elixir - eex.sublime-snippet
<snippet>
  <content><![CDATA[
<% ${1:expr} %>
]]></content>
  <!-- Optional: Set a tabTrigger to define how to trigger the snippet -->
  <tabTrigger>ee</tabTrigger>
  <!-- Optional: Set a scope to limit where the snippet will trigger -->
  <!-- <scope>source.html</scope> -->
</snippet>
```

```
# Elixir - eex2.sublime-snippet
<snippet>
  <content><![CDATA[
<%= ${1:expr} %>
]]></content>
  <!-- Optional: Set a tabTrigger to define how to trigger the snippet -->
  <!-- Setting the ee= version in case I have muscle memory -->
  <tabTrigger>ee=</tabTrigger>
  <!-- Optional: Set a scope to limit where the snippet will trigger -->
  <!-- <scope>source.html</scope> -->
</snippet>
```

```
# Elixir - inspect.sublime-snippet
<snippet>
  <content><![CDATA[
IO.inspect(${1:expr}, label: "${2:label}")
]]></content>
  <!-- Optional: Set a tabTrigger to define how to trigger the snippet -->
  <tabTrigger>inspect</tabTrigger>
  <!-- Optional: Set a scope to limit where the snippet will trigger -->
  <scope>source.elixir</scope>
</snippet>
```

```
# HTML (EEx).sublime-settings
{
  "extensions":
  [
    "leex"
  ]
}
```
