' ********** Copyright 2016 Roku Corp.  All Rights Reserved. **********  

sub init()

    m.top.SetFocus(true)

    ' styling
	m.top.backgroundURI = ""
    m.top.backgroundColor = "#f4f4f4"

    ' set global var
    m.content_grid = m.top.FindNode("content_grid")
    m.live_stream = m.top.FindNode("live_stream")
    m.audio = createObject("RoSGNode", "Audio")

    'Create Forms
    m.live_stream = m.top.FindNode("live_stream")

    'observe
    m.content_grid.observeField("itemFocused","setSelection")
    m.content_grid.observeField("itemSelected","uiitemselected")
    
    'Set Items
    loadMainScene()

End sub

'User Selection
sub setSelection()
    selected = m.content_grid.content.getChild(m.content_grid.itemFocused)
    ' ? "Selected Content Grid"
    ' ? selected 
end sub

sub UIItemSelected()

    'print debug
    ? "UI Item Selected"

    'Get Selected Item
    playStream = m.content_grid.content.getChild(m.content_grid.itemFocused)

    'Play Stream
    'PlayLiveStream(playStream)
    OpenScreen(playStream)

end sub


'LOAD POSTER GRID
function loadMainScene()

    ? "================================================"
    ? "  Load Main Scene Poster "

    'Create Content Nodes
    postercontent = createObject("roSGNode","ContentNode")
    node = CreateObject("roSGNode","ContentNode")
    node2 = CreateObject("roSGNode","ContentNode")
    node3 = CreateObject("roSGNode","ContentNode")

    'Populate Nodes - TODO - Move to JSON call
    node.id = "streamingarchive"
    node.title = "Streaming Archive"
    node.description = "This is a test"
    node.HDGRIDPOSTERURL = "pkg:/images/archive_image.png"
    node.SHORTDESCRIPTIONLINE1 = "This is the streaming archive"
    node.SHORTDESCRIPTIONLINE2 =  "Second Line"
    postercontent.appendChild(node)

    node2.id = "livestream"
    node2.title = "Live Stream"
    node2.description = "This is a test"
    node2.HDGRIDPOSTERURL = "pkg:/images/listen_live_image.png"
    node2.SHORTDESCRIPTIONLINE1 = "This is the live stream"
    node2.SHORTDESCRIPTIONLINE2 = "Second Line"
    postercontent.appendChild(node2)

    'Populate Main Scene Poster Grid
    m.content_grid.content=postercontent
    m.content_grid.visible=true
    m.content_grid.setFocus(true)
end function


'BUTTON SELECTION
function onKeyEvent(key as String, press as Boolean) as Boolean
    result = false
    
    return result 
end function
