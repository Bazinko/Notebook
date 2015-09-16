import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;


public class Fourth extends HttpServlet {

    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        resp.setContentType("text/html;charset=utf-8");
        PrintWriter pw = resp.getWriter();

        try {
            //ищем класс jdbc
            Class.forName("com.mysql.jdbc.Driver");
            //конектимся к бд(путь, имя пользователя, пароль соответсвенно)
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/" +
                    "Notebook", "root", "");
            //создаем объект для выполнения запроса
            Statement stat = con.createStatement();
            //выполняем запрос
            stat.execute("DELETE FROM Notebooks WHERE Monitor is null OR RamCapacity is null OR GraphicCardCapacity is null");
            PreparedStatement statement = con.prepareStatement("SELECT * from Notebooks");

            //результат запроса
            @SuppressWarnings("unused")
            ResultSet result = statement.executeQuery();
            pw.println("<table border>");
            pw.println("<TR>");
            pw.println("<TH>id</TH> <TH>Объем ЖД(в гб)</TH> <TH>Объем ОП(в гб)</TH> <TH>Объем вдиеокарты(в гб)</TH>" +
                    "<TH>Диагональ</TH> <TH>Модель ноутбука</TH> <TH>Модель ЦП</TH> <TH>Частота ЦП</TH>");
            pw.println("</TR>");

            while (result.next()) {
                pw.println("<TR>");
                //
                pw.println("<TD>" + result.getString("Num") + "</TD>");
                pw.println("<TD>" + result.getString("HardDriveCapacity") + "</TD>");
                pw.println("<TD>" + result.getString("RamCapacity") + "</TD>");
                pw.println("<TD>" + result.getString("GraphicCardCapacity") + "</TD>");
                pw.println("<TD>" + result.getString("Monitor") + "</TD>");
                pw.println("<TD>" + result.getString("Brand") + "</TD>");
                pw.println("<TD>" + result.getString("CpuName") + "</TD>");
                pw.println("<TD>" + result.getString("CpuFreq") + "</TD>");
                //
                pw.println("</TR>");
            }

            pw.println("</table>");



            pw.close();

        } catch (Exception e1) {
// TODO: handle exception
            System.out.println(e1);
        }
    }
}
