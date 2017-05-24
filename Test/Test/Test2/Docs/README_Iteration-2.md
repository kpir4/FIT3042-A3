team-32_Assignment-5-Iteration-2-overview

### Description:
A Morse code interpreter that takes a sequence of short and long motions from a PIR motion sensor as input and outputs the corresponding letter.

A short motion is interpreted as a dot and a long motion is interpreted as a dash.

### How to run:
To start the server, run the command:
```
node server.js
```
### Components:
1. Arduino Uno
2. USB Type-A to USB Type-B cable
3. IR motion sensor
4. Jumper cables
5. Server hosting computer

### Board Configuration:
1. The sensor is wired with Ground to Ground, Out to Digital I/O pin 2 and VCC to 5V.
2. The board must be plugged in to the machine running the server, which must have permissions to access it.

### Implemented this Release:
1. Motion Interpreter now understands morse code for numbers 0-9.
2. Motion Interpreter now understands morse code for puncuation marks ('.', ',', ':', '?', ''', '-', '/', '@', '=').
3. Program ends gracfully when Motion Interpretor detects the "SK" (End of Transmission) prosign motion.
4. Client now creates a log of the detected motions, rather than just displaying the last one.
5. Client can start and stop the server from transmitting any data.
6. Client now has a polished interface.

### Required Software:
1. Node.js installed on the server machine
2. Express installed into node
3. Serialport installed into node
4. Socket.io installed into node
To install software 2-4, run the command:
```
npm install
```

SEE "package.json" FOR MORE DETAILS.

### Important Points:
1. When the program starts the board must not be detecting motion before the recording can begin (see limitations point 1).


### Known Problems and Limitations:
1. When first running the program, it is important that the first event be a motion start. 
	It is coded such that if the board is currently detecting motion when the program starts, it needs a motion end before anything will happen. 
	Essentially, when the program starts, before anything happens, the board must post a motion start.
2. There is currently no way to stop detecting motion.
3. With a server restart, all previous motions are forgoten.
4. When the client is reset, all previously recieved characters are forgotten by the client.
5. Only one space can be detected to occur between words. A length equivalent to more than one space will only trigger the space 'timeout' once.
6. If the client refreshes or another client connects to the server, multiple instances of connections and motion detections will be made on the server side.