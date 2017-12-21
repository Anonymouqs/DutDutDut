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

        rudimentGen(1,cursor);
        Qt.quit();
      }
      function rudimentGen(rud,cursor)
      {
        var base = 1;
        var strike = 50;
        switch(rud)
        {
          case 1:
            cursor.setDuration(1,32/base)
            var note  = newElement(Element.NOTE);
            var text  = newElement(Element.STAFF_TEXT)
            text.text = "L";
            cursor.add(text);
            cursor.addNote(strike);


            console.log(cursor.element.notes[0].pitch);

            break;

          default:
            break;

        }
      }
      }
