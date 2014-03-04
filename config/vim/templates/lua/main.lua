#!/usr/bin/env lua

function main(args)

end

function parse_args(args)
    local argparse = require("argparse")
    local parser = argparse()
    return parser:parse(args)
end

main(parse_args(arg))
