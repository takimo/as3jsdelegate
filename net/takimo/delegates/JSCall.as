package net.takimo.delegates
{
    //[note]delete externalInterface
    import flash.external.ExternalInterface;
    import flash.events.EventDispatcher;
    import net.takimo.events.JSCallEvent;

    public class JSCall extends EventDispatcher
    {
        public function get method():String
        {
            return _method;
        }
        private var _method:String;
        public function set method(method:String):void
        {
            _method = method;
        }

        public function get params():*
        {
            return _params;
        }
        private var _params:*
        public function set params(params:*):void
        {
            _params = params;
        }

        public function get id():*
        {
            return _id;
        }
        private var _id:*;
        public function set id(id:*):void
        {
            _id = id;
        }

        public function JSCall(method:String, params:*):void
        {
            _method = method;
            _params = params;
        }

        public function fire(result:*):void
        {
            var event:JSCallEvent = new JSCallEvent(JSCallEvent.RECIVE);
            event.result = result;
            dispatchEvent(event);
        }
    }
}
