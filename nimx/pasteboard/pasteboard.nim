when defined(macosx):
    import pasteboard_mac
    export pasteboard_mac

elif defined(windows):
    import pasteboard_win
    export pasteboard_win

else:
    import abstract_pasteboard
    export abstract_pasteboard
    proc pasteboardWithName*(name: string): Pasteboard = result.new()


when isMainModule:
    # Some tests...
    let pb = pasteboardWithName(PboardGeneral)
    pb.writeString("Hello world!")
    let s = pb.readString()
    echo s
