package net.takimo.events
{
    import flash.events.Event;

    public class JSCallEvent extends Event
    {
        public static const RECIVE:String = "jscall_recive";

        public function get result():*
        {
            return _result;
        }
        private var _result:*;
        public function set result(result:*):void
        {
            _result = result;
        }

        public function JSCallEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false):void
        {
            super(type, bubbles, cancelable);
            _result = null;
        }

    }

}
