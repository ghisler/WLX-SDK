unit listplug; { Contents of file listplug.pas }

interface

const
  lc_copy=1;
  lc_newparams=2;
  lc_selectall=3;
  lc_setpercent=4;

  lcp_wraptext=1;
  lcp_fittowindow=2;
  lcp_ansi=4;
  lcp_ascii=8;
  lcp_variable=12;
  lcp_forceshow=16;
  lcp_fitlargeronly=32;
  lcp_center=64;

  lcs_findfirst=1;
  lcs_matchcase=2;
  lcs_wholewords=4;
  lcs_backwards=8;

  itm_percent=$FFFE;
  itm_fontstyle=$FFFD;
  itm_wrap=$FFFC;
  itm_fit=$FFFB;
  itm_next=$FFFA;
  itm_center=$FFF9;

  LISTPLUGIN_OK=0;
  LISTPLUGIN_ERROR=1;

type
  tListDefaultParamStruct=record
    size,
    PluginInterfaceVersionLow,
    PluginInterfaceVersionHi:longint;
    DefaultIniName:array[0..MAX_PATH-1] of char;
  end;
  pListDefaultParamStruct=^tListDefaultParamStruct;

{ Function prototypes: Functions need to be defined exactly like this!}
{
function ListLoad(ParentWin:thandle;FileToLoad:pchar;ShowFlags:integer):thandle; stdcall;
function ListLoadW(ParentWin:thandle;FileToLoad:pwidechar;ShowFlags:integer):thandle; stdcall;
function ListLoadNext(ParentWin,PluginWin:thandle;FileToLoad:pchar;ShowFlags:integer):integer; stdcall;
function ListLoadNextW(ParentWin,PluginWin:thandle;FileToLoad:pwidechar;ShowFlags:integer):integer; stdcall;
procedure ListCloseWindow(ListWin:thandle); stdcall;
procedure ListGetDetectString(DetectString:pchar;maxlen:integer); stdcall;
function ListSearchText(ListWin:thandle;SearchString:pchar;
                        SearchParameter:integer):integer; stdcall;
function ListSearchTextW(ListWin:thandle;SearchString:pwidechar;
                        SearchParameter:integer):integer; stdcall;
function ListSearchDialog(ListWin:thandle;FindNext:integer):integer; stdcall;
function ListSendCommand(ListWin:thandle;Command,Parameter:integer):integer; stdcall;
function ListPrint(ListWin:thandle;FileToPrint,DefPrinter:pchar;
                   PrintFlags:integer;var Margins:trect):integer; stdcall;
function ListPrintW(ListWin:thandle;FileToPrint,DefPrinter:pwidechar;
                   PrintFlags:integer;var Margins:trect):integer; stdcall;
{$ifdef win64}
function ListNotificationReceived(ListWin:thandle;Message:integer;wParam:WPARAM;lParam:LPARAM):integer; stdcall;
{$else}
ListNotificationReceived(ListWin:thandle;Message:integer;wParam,lParam:integer):integer; stdcall;
{$endif}
procedure ListSetDefaultParams(dps:pListDefaultParamStruct); stdcall;
function ListGetPreviewBitmap(FileToLoad:pchar;width,height:integer;
    contentbuf:pchar;contentbuflen:integer):hbitmap; stdcall;
function ListGetPreviewBitmapW(FileToLoad:pwidechar;width,height:integer;
    contentbuf:pchar;contentbuflen:integer):hbitmap; stdcall;
}

implementation
end.
