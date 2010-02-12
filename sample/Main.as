package
{
    //[note]delete
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
            var profileCall:JSCall = new JSCall("getProfile");
            profileCall.addEventListener(JSCallEvent.RECIVE, profile_reciveHandler);

            profileCall.params = "348777";
            delegate.execute(profileCall);

            profileCall.params = "332493";
            delegate.execute(profileCall);
        }

        private function profile_reciveHandler(e:JSCallEvent):void
        {
            ExternalInterface.call("alertMessage", "nickname: " + e.result.nickname);
        }
    }

}
