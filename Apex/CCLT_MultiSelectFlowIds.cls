/**-------------------------------------------------------------------------- 
プログラム名 CCLT_MultiSelectFlowIds
* 概　要 ：セミコロン区切りのID文字列をフロー対応のリスト型にして返却する
* 作成日 ：2023.02.17 
* 作成者 ：クリエイティブコンテンツラボトウキョウ
*--------------------------------------------------------------------------**/
public with sharing class CCLT_MultiSelectFlowIds {
    
    @InvocableMethod(label='FlowのIDリストを指定' description='セミコロン区切りのID文字列をフロー対応のリスト型にして返却する')
    public static List<List<String>> getIdList(List<String> ids) {
        
        if(!(ids.isEmpty())){        
            string tempStr = ids[0];  
            List<String> lstnew = tempStr.split(';');
            list<list<string>> finalLst = new list<list<string>>();
            finalLst.add(lstnew);
            return finalLst;
        //IDリストが指定されていない場合NULLを返却
        } else {
            return null;
        }
    }        
}