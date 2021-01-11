package com.kk.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.kk.pojo.Admin;
import com.kk.pojo.Books;
import com.kk.pojo.Reader;
import com.kk.service.AdminService;
import com.kk.service.BookService;
import com.kk.service.ReaderService;
import com.kk.utils.AjaxResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/book")
public class BookController {

    @Autowired
    private BookService bookService;

    @Autowired
    private AdminService adminService;

    @Autowired
    private ReaderService readerService;

    // 1. 跳转到登录页面
    @RequestMapping("/tologin")
    public String login(){
        return "login";
    }

    // 2. 跳转到登注册页面
    @RequestMapping("/toregist")
    public String regist(){
        return "regist";
    }

    // 3. 登录验证
    @RequestMapping("/dologin")
    @ResponseBody
    public AjaxResult list(String name, int password, String access, HttpSession session){

        AjaxResult ajaxResult = new AjaxResult();

        try{
            //1.管理员
            if(access.equals("0")){
                Admin ad = new Admin();
                ad.setName(name);
                ad.setPwd(password);
                Admin admin = adminService.select(ad);

                if(admin != null){
                    session.setAttribute("admin",admin);
                    ajaxResult.setStu("0");
                }else{
                    ajaxResult.setStu("2");
                    ajaxResult.setMsg("用户名或密码错误");
                }
            }

            //2.读者
            if(access.equals("1")){
                Reader rd = new Reader();
                rd.setName(name);
                rd.setPwd(password);
                Reader reader = readerService.select(rd);
                if(reader != null){
                    session.setAttribute("reader",reader);
                    ajaxResult.setStu("1");
                }else{
                    ajaxResult.setStu("2");
                    ajaxResult.setMsg("用户名或密码错误");
                }
            }
        }catch (Exception e){
            e.printStackTrace();
            ajaxResult.setStu("8");
            ajaxResult.setMsg("服务器异常,请改天登录");
        }

        return ajaxResult;
    }

//    跳转到新增书籍页面
    @RequestMapping("/toaddpage")
    public String toAddPage(){
        return "bookAdd";
    }

    @RequestMapping("/toupdatepage")
    public String toUpdatePage(int id,Model model){
        Books book = bookService.queryById(id);
        model.addAttribute("book",book);
        return "updateBook";
    }

//   查找所有书籍
    @RequestMapping("/homepage")
    public String ListBooks(Model model){
        List<Books> booksList = bookService.queryAllBook();
        model.addAttribute("books", booksList);
        return "homePage";
    }

    @RequestMapping("/booklist")
    @ResponseBody
    public Map<String, Object> allBook(@RequestParam(defaultValue = "1", value = "page")
                                 Integer pageNum,
                                       ModelMap modelMap,
                                       @RequestParam(defaultValue = "5", value = "limit")
                                 Integer pageSize) {

        PageHelper.startPage(pageNum,pageSize);
        List<Books> booksList = bookService.queryAllBook();
        PageInfo<Books> pageInfo = new PageInfo<>(booksList);

        // Layui table 组件要求返回的格式
        HashMap<String, Object> tableObj = new HashMap<>();
        tableObj.put("code", 0);
        tableObj.put("msg", "");
        tableObj.put("count",pageInfo.getTotal());
        tableObj.put("data",booksList);

        return tableObj;
    }


    //    分页查找
    @RequestMapping("/homepagefy")
    public String fyBook(@RequestParam(defaultValue = "1", value = "pageNum")
                                     Integer pageNum,
                         ModelMap modelMap,
                         @RequestParam(defaultValue = "5", value = "pageSize")
                                     Integer pageSize) {
        PageHelper.startPage(pageNum,pageSize);
        List<Books> booksList = bookService.fyAllBook();
        PageInfo<Books> pages = new PageInfo<>(booksList);
        modelMap.addAttribute("pageInfo",pages);
        return "homePageFY";
}

//    通过id查找一本书籍
    @RequestMapping("/findbyid")
    public String findById(int id, Model model){
        Books book = bookService.queryById(id);
        model.addAttribute("book", book);
        return "findById";
    }

//    添加一本书籍
    @RequestMapping("/addbook")
    public String addBook(Books books, Model model){
        bookService.addBook(books);
        model.addAttribute("book", books);
        return "redirect:/book/homepage";
    }

//    删除一本书籍
    @RequestMapping("/delebook")
    public String deleteBook(int id, Model model){
        System.out.println("books.id=>"+id);
        bookService.deleteBook(id);
        return "redirect:/book/homepage";
    }

//    修改书本信息
    @RequestMapping("/updatebook")
    public String updateBook(Books books, Model model){
        bookService.updateBook(books);
        System.out.println("books=>"+books);
        return "redirect:/book/homepage";
    }
}
