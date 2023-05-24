package com.fengwo.reading.flutter_app

import android.content.Context
import android.util.Log
import android.widget.Toast

class NativeApiImpl(val context: Context) : Pigeon.NativeApi {

    override fun saveBook(book: Pigeon.Book): Boolean {
        Toast.makeText(context, "书名：${book.title} 作者：${book.author?.name}", Toast.LENGTH_SHORT)
            .show()
        return true
    }

    override fun searchBook(keyword: String): Pigeon.Book? {
        return Pigeon.Book().apply {
            title = "明朝那些事儿"
            author = Pigeon.Author().apply {
                name = "天涯明月"
                male = false
                state = Pigeon.StateEnum.SUCCESS
            }
        }
    }

    override fun searchBooks(keyword: String): MutableList<Pigeon.Book> {
        return mutableListOf(Pigeon.Book().apply {
            title = "康熙王朝"
            author = Pigeon.Author().apply {
                name = "二月河"
                male = false
                state = Pigeon.StateEnum.SUCCESS
            }
        })
    }

    override fun searchBooks2(keys: MutableList<String>): MutableList<Pigeon.Book> {
        return mutableListOf(Pigeon.Book().apply {
            title = "雍正王朝"
            author = Pigeon.Author().apply {
                name = "二月河"
                male = false
                state = Pigeon.StateEnum.SUCCESS
            }
        })
    }

    override fun noArguments() {
        Log.d("native", "Flutter调用了原生的 noArguments()方法")
    }

    override fun getSomething(result: Pigeon.Result<String>?) {
        result?.success("呀哈哈~")
    }

    override fun add(a: Long, b: Long): Long {
        return a.plus(b)
    }

}