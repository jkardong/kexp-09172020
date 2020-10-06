
REM ********************************************************************
REM ********************************************************************
REM ==
REM ==  KEXP Roku TV
REM ==  Author: J Kardong
REM ==  Copyright: Friends of KEXP
REM ==  Created: Sept 25
REM ==  Description: Referenced from the MainScene.xml file
REM ==
REM ********************************************************************
REM ********************************************************************


REM ********************************************************************
REM     Hide and show screens
REM ********************************************************************
sub OpenScreen(obj)

    if(obj.id = "streamingarchive")

        ? "********************************************************************"
        ? "CALL PLAY DATA LIVE STREAM"
        ? "********************************************************************"
        m.jsonloadertask = CreateObject("roSGNode","jsonloadertask")
        m.jsonloadertask.control = "run"

    else if (obj.id = "livestream")
        m.content_grid.visible = false
        m.header_label = m.top.FindNode("header_label")
        m.header_label.visible = false
        m.live_stream.visible = true
        PlayLiveStream(obj)
    end if

end sub

REM ********************************************************************
REM     Play The Live Stream
REM ********************************************************************
sub PlayLiveStream(obj)

    ' stop play if playing
    if(m.audio.control = "play")
        m.audio.control = "stop"
    end if 

    ' play just the livestream
    if (obj.id = "livestream")

        'create a content node
        content = CreateObject("roSGNode","ContentNode")

        'set vars
        encode = "mp3"

        'create Node 'TODO - Toggle Logic To Be Added
        content.setFields({
            streamformat: encode
            url: GetLiveStream(encode)
            live: true
        }) 

        'set Node to player
        m.audio.content = content

        'Play Stream
        m.audio.control = "play"

        'Change Play Image 
        m.livestream_play_button = m.top.FindNode("livestream_play_button")
        m.livestream_play_button.uri = "pkg:/images/misc/pause.png"

    end if
end sub

REM ********************************************************************
REM     Load Live Stream JSON
REM ********************************************************************
sub LoadLiveStreamJSON(obj)

    ' request the content feed from the API
    xfer = CreateObject("roURLTransfer")
    xfer.SetCertificatesFile("common:/certs/ca-bundle.crt")
    xfer.SetURL("https://jonathanbduval.com/roku/feeds/roku-developers-feed-v1.json")
    rsp = xfer.GetToString()
    rootChildren = []
    rows = {}

end sub
