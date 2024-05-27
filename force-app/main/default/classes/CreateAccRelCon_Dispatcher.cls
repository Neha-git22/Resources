public class CreateAccRelCon_Dispatcher{

    public static void dispatch(System.TriggerOperation operationType){
        switch on operationType{
            WHEN BEFORE_INSERT{

            }
            WHEN AFTER_INSERT{
                CreateAccRelCon_Handler.ConCreate(Trigger.new);
            }
            WHEN BEFORE_UPDATE{

            }
            WHEN AFTER_UPDATE{

            }
            WHEN BEFORE_DELETE{

            }
            WHEN AFTER_DELETE{

            }
            WHEN AFTER_UNDELETE{
                CreateAccRelCon_Handler.ConCreate(Trigger.new);
            }
            WHEN ELSE{

            }
        }
    }
}