package net.takimo
{
    //[note]後で消す
    import flash.external.ExternalInterface;

    import flash.display.Sprite;
    import net.takimo.delegates.JSCall;
    import net.takimo.delegates.JSDelegate;
    import net.takimo.events.JSCallEvent;

    public class Main extends Sprite
    {
        public function Main():void
        {
            var delegate:JSDelegate = new JSDelegate();
            var profileCall:JSCall = new JSCall("getProfile", "348777", 1);
            profileCall.addEventListener(JSCallEvent.RECIVE, profile_reciveHandler);
            delegate.execute(profileCall);
        }

        private function profile_reciveHandler(e:JSCallEvent):void
        {
            ExternalInterface.call("alertMessage", e.result.nickname);
        }
    }

}
