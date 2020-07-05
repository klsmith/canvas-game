/*
 * All ports functionality goes through here!
 */
function addPorts(elmApp) {

  /*** ELM TO JS PORT ***/

  if (elmApp.ports && elmApp.ports.elmToJs) {
    elmApp.ports.elmToJs.subscribe(listen);
  } else {
    console.log("ELM to JS port NOT hooked up on the ELM side!")
  }

  var listeners = {};

  function listen([msg, value]) {
    if (listeners[msg]) {
      listeners[msg](value);
    } else {
      console.log("JS received junk msg from ELM: ", msg)
    }
  }

  /*** JS TO ELM PORT ***/

  function send(msg, value) {
    if (elmApp.ports && elmApp.ports.jsToElm) {
      elmApp.ports.jsToElm.send([msg, value]);
    } else {
      console.log(msg + ": JS TO ELM port NOT hooked up on the ELM side!")
    }
  }

  /*** CONSOLE LOG PORT LOGIC ***/
  listeners["Ports.Log.string"] =
    function(string) {
      console.log(string);
    }

}
