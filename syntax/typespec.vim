" syntax highlighting for typespec (.tsp)

if exists("b:current_syntax")
  finish
endif

" keywords
syntax keyword tspKeyword model namespace using import enum op extends interface
syntax keyword tspControl if else return
syntax keyword tspModifier is extends
syntax keyword tspPrimitive string int float boolean void null never
syntax keyword tspAnnotation @error @service

" built-in types
syntax keyword tspBuiltinType numeric integer float decimal decimal128
syntax keyword tspBuiltinType int8 int16 int32 int64 uint8 uint16 uint32 uint64
syntax keyword tspBuiltinType safeint
syntax keyword tspBuiltinType string url uuid
syntax keyword tspBuiltinType boolean
syntax keyword tspBuiltinType bytes
syntax keyword tspBuiltinType duration offsetDateTime plainDate plainTime unixTimestamp32 utcDateTime

" decorators/annotations
syntax match tspDecorator /@\(\w\+\.\)*\w\+/
highlight def link tspDecorator PreProc

" import paths
syntax match tspImportPath /"@[^"]\+"/
highlight def link tspImportPath String

" comments
syntax match tspLineComment "//.*$"
syntax region tspDocComment start="/\*\*" end="\*/" keepend
syntax region tspBlockComment start="/\*" end="\*/" keepend

" strings literals
syntax region tspString start=/"/ skip=/\\"/ end=/"/

" numbers literals
syntax match tspNumber /\<\d\+\(\.\d\+\)\?\>/

" functions (in interfaces)
syntax match tspFuncName /\w\+\s*(/ contained
syntax region tspMethod start=/@\(get\|post\|patch\|delete\)/ end=/;/ contains=tspDecorator,tspFuncName

" highlight links
highlight def link tspKeyword Keyword
highlight def link tspControl Conditional
highlight def link tspModifier Type
highlight def link tspPrimitive Type
highlight def link tspType Constant
highlight def link tspAnnotation Special
highlight def link tspDecorator PreProc
highlight def link tspImportPath String
highlight def link tspLineComment Comment
highlight def link tspBlockComment Comment
highlight def link tspDocComment Comment
highlight def link tspString String
highlight def link tspNumber Number
highlight def link tspFuncName Function
highlight def link tspMethod Statement
highlight def link tspBuiltinType Type

let b:current_syntax = "typespec"
