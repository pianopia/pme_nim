# docopt用のコマンドライン引数定義
const doc = """
Usage:
  pme_nim <action> [[<content>],[<tag>]] [-t | --tag]

Options:
  <action>    ToDo Action
  <content>   ToDo Content
  <tag>       ToDo Task Tag
  -t --tag    ToDo Tag Option
"""

import system, os, options, random, times, strUtils
import docopt
import nimSHA2
import streams
import memfiles
import posix_utils

const
  DATA_SEARCH_RESULT_DIR = getHomeDir() & ".pme_nim/search_result"
  DATA_PROCESS_LIST_DIR = getHomeDir() & ".pme_nim/process_list"

type Pme = object

# 検索タイプ
type PmeSearchType = enum
  INT_TYPE
  STRING_TYPE

# 現在時刻のSHA256ハッシュを生成
proc getNowHash: string =
    let nowStr: string = format(now(), "yyyy/MM/dd HH:mm:ss")
    return $(computeSHA256(nowStr).hex())

# 初期化
proc init =
    if os.existsFile(DATA_SEARCH_RESULT_DIR) and os.existsFile(DATA_PROCESS_LIST_DIR):
        discard
    else:
        # create data directory
        createDir(getHomeDir() & ".pme_nim")
        writeFile(DATA_SEARCH_RESULT_DIR, "")
        writeFile(DATA_PROCESS_LIST_DIR, "")

## ポインタの検索
proc searchMemoryMap(pme: var Pme, search_type: PmeSearchType): float =
    # TODO
    return 0x00000000

## アプリケーションプロセスのリスト
proc showProcessList(pme: Pme): string =
    # TODO: プロセス一覧を取得
    return ""

proc overwriteMemory(p: pointer, data: string): bool =
    memoryUnlockAll()
    return true

when isMainModule:
  try:
    var memMap = memfiles.open(filename = "/usr/bin/vm_stat",  allowRemap = true)
    var memPointer = memMap.mapMem(mappedSize = 1024)
    echo repr(memPointer)
    #for line in lines(memMap):
        #  echo line
  except:
    echo("error!!!")
    raise


# ポインタアドレスの検索

# ポインタ　書き込み

# プロセスの停止、再開
