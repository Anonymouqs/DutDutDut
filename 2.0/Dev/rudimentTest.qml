import QtQuick 2.0
import MuseScore 1.0

MuseScore {
      menuPath: "Plugins.pluginName"
      onRun:
      {
        var cursor   = curScore.newCursor();
        cursor.staffIdx = 0;
        cursor.voice = 0;
        cursor.rewind(0);
        print(curScore.lastMeasure == cursor.measure);

        rudimentGen(1,cursor);
        //derp
        Qt.quit();
      }

      function rudimentGen(rud,cursor)
      {
        var base = 1;
        var strike = 50;

        var sticking = 5;
        //Math.floor(Math.random() * 2);
        console.log("Rudiment # " + rud + " Sticking: " + sticking);
        switch(rud)
        {
          case 1:
          cursor.setDuration(1,32/base);
          var text  = newElement(Element.STAFF_TEXT);

            if (sticking == 0)
            {

              for(var i = 0; i <= 1; i++)
              {
              text.text = "L";
              cursor.add(text);
              cursor.addNote(strike);
              text.text = "R";
              cursor.add(text);
              cursor.addNote(strike);
            }

          }
          else if(sticking == 1)
          {
            text.text = "L";
            cursor.add(text);
            cursor.addNote(strike);
            text.text = "R";
            cursor.add(text);
            cursor.addNote(strike);
          }

            console.log(cursor.element.notes[0].pitch);

            break;

          default:
            break;

        }
      }
      }
