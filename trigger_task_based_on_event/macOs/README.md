# trigger task based on event
In macOs it can be achieve by *LaunchAgents*. Launching LaunchAgent is handled by **_launchd_**
[You can read more about this here](https://developer.apple.com/library/archive/documentation/MacOSX/Conceptual/BPSystemStartup/Chapters/CreatingLaunchdJobs.html)

#### Some **useful** event supported by LaunchAgents:
- Execute task on demand
- Execute task on log in
- Execute task on logout
- Execute task on calendar date time(support daily, monthly, yearly as well)
- Execute task after a fixed time
- Execute on specific file/directory changes

#### launchd startup process
1. It load launchagents from /System/Library/LaunchAgents, /Library/LaunchAgents and ~/Library/LaunchAgents
1. It registers the sockets and file descriptors requested by those user agents.
1. It launches any user agents that requested to be running all the time.
1. As requests for a particular service arrive, it launches the corresponding user agent and passes the request to it.
1. When the user logs out, it sends a SIGTERM signal to all of the user agents that it started.

#### Define a LaunchAgent
We create a xml formatted .plist file which define the name of agent, what argument it required, when it should be execute and many more.
I will talk about very limited set of available properties.

Required property
1. Label -> unique identifier
1. ProgramArguments -> arguments used to launch
1. inetdCompatibility -> indicate that your task require separate instance
1. KeepAlive -> indicate whether to run this whole time or launch on-demanded

> Sample code
```nano
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
    <dict>
        <key>Label</key>
        <string>com.example.app</string>
        <key>Program</key>
        <string>/User/Jitendra/Scripts/helloworld.sh</string>
        <key>RunAtLoad</key>
        <true/>
    </dict>
</plist>
```

Recently I heard about time tracking. It implies that you track each n minutes and categories that to break, meal, work, project, reading and all.
I am also planning to watch a ted talk daily.

So I will create 2 task:

|S.No | task | agent file | script to execute |
|:---|:---|:---|:---|
| 1 | Which execute every 30 minute time interval.| com.learn.timetrack.plist| starttimetracking.sh|
| 2 | Which execute whenever I log in to my computer.| com.learn.login.after.plist| dailyTaskOnLogin.sh|

> Please go through these codes. I have added comments to explain syntax.

First move agents file to /‘~/Libarary/LaunchAgents/‘.
Launcctl is used to handle agents load, unload, start .

To load agent

```
launchctl load <path to agent file>
```

To check agent

```
launchctl list | grep <label of your script>
```
>output format: 
> PID	 Status	Label
> -	 0	      com.myscript.onunlocktask

If pid is - implies that agent is not running.
Different Status code have different meaning which you can search on internet.

To check agent

```
launchctl list | grep <label of your script>
```

To manually start agent

```
launchctl start <path to agent file>
```

To unload agent

```
launchctl unload <path to agent file>
```