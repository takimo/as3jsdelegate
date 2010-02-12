package net.takimo.delegates
{
    import flash.external.ExternalInterface;
    import flash.system.Security;
    import net.takimo.delegates.JSCall;

    public class JSDelegate
    {
        private var _calls:Object = {};
        private var _callCount:Number = 0;

        private static const JS_GETHOSTNAME:String = "function() { return location.hostname }";
        private static const BRIDGE_NAME:String = "replyCall";
        private static const VERSION:String = "version 0.0.0.1";

        public function JSDelegate():void
        {
            trace(VERSION);

            Security.allowDomain(ExternalInterface.call(JS_GETHOSTNAME));
            ExternalInterface.addCallback(BRIDGE_NAME, reciveReply);
        }

        public function execute(call:JSCall):void
        {
            call.id = ++_callCount;

            _calls[call.id.toString()] = call;
            ExternalInterface.call(call.method, call.params, call.id);
        }

        public function reciveReply(result:*, id:*):void
        {
            var call:JSCall = _calls[id.toString()];
            call.fire(result);
        }

    }
}
