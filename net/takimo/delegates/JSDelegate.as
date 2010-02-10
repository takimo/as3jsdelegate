package net.takimo.delegates
{
    import flash.external.ExternalInterface;
    import net.takimo.delegates.JSCall;
    import flash.system.Security;

    public class JSDelegate
    {
        private var _calls:Object;

        public function JSDelegate():void
        {
            trace("version 0.0.0.1");

            _calls = {};
            Security.allowDomain(ExternalInterface.call("function() { return location.hostname }"));

            ExternalInterface.addCallback('replyCall', reciveReply);
        }

        public function execute(call:JSCall):void
        {
            if(_calls[call.id])
                trace("same request id used");

            _calls[call.id.toString()] = call;
            ExternalInterface.call(call.method, call.params, call.id);
        }

        public function reciveReply(result:*, id:*):void
        {
            var call:JSCall = _calls[id];
            call.fire(result);
        }
    }
}
