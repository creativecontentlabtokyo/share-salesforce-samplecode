/**--------------------------------------------------------------------------
 * プログラム名:CCLT_MultiSelectFlowIdsTest
 * 概　要 CCLT_MultiSelectFlowIdsテストクラス 
* 作成日 ：2023.02.18 
* 作成者 ：クリエイティブコンテンツラボトウキョウ
 * --------------------------------------------------------------------------**/
@isTest(SeeAllData=false)
public with sharing class CCLT_MultiSelectFlowIdsTest {
    @isTest
    public static void getIdList_case1() {
        // 取引先を作成
        Account acc1 = new Account(name='cclt');
        insert acc1;
        // 募集人を2名作成
        List<Contact> conList = new List<Contact>();
        conList.add(new Contact(FirstName='creative', Lastname='content',AccountId=acc1.id));
        conList.add(new Contact(FirstName='lab', Lastname='tokyo',AccountId=acc1.id));
        insert conList;
        //String型のリストを生成
        List<String> ids = New List<String>();
        //取引先のIDをセミコロンで結合した文字列をStringリストに格納
        ids.add(conList[0].id + ';' +conList[0].id);
        //テスト開始
        Test.startTest();
            //セミコロンで結合したIDをIDのリスト型で返却するメソッドを実行
            List<List<String>> listd = CCLT_MultiSelectFlowIds.getIdList(ids);
            //リストのレコードが2件返却されればOK
            system.assertEquals(2,listd[0].size());
        //テスト終了
        Test.stopTest();
    }
    /**
     *　メソッドに空文字列を渡した場合にNULLが返却されることを確認
     */
    @isTest
    public static void getIdList_case2() {
        //文字列のリストを生成　※値は設定しない
        List<String> ids = New List<String>();
        //テスト開始
        Test.startTest();
            List<List<String>> listd = CCLT_MultiSelectFlowIds.getIdList(ids);
            //NULLが返却されればOK
            system.assertEquals(null,listd);
        //テスト終了
        Test.stopTest();
    }
        
}