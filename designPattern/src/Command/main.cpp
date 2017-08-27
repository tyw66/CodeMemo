#include<iostream>

//尽量没要指针

//接收者
class Receiver{
public:
    void action(){
        std::cout<<"Receiver execute the action."<<std::endl;
    }
};

//命令类
class Command{
protected:
    Receiver receiver;

public:
    Command()
    {

    }
    ~Command()
    {

    }

    Command(Receiver receiver_){
        receiver=receiver_;
    }
    virtual void execute()=0;
};

//具体命令类
class ConctreteCommand:public Command{
public:
    ConctreteCommand(Receiver receiver):Command(receiver){
    }
    ~ConctreteCommand(){
    }

    void execute(){
        receiver.action();
    }
};


//客户端调用类
class Invoker{

private:
    Command* command;

public:
    Invoker(){

    }
    ~Invoker(){

    }
    void setCommand(Command* command_){
        command=command_;
    }

    void executeCommand(){
        command->execute();
    }
};


int main(int argc, char *argv[])
{
    Receiver r;
    ConctreteCommand cc(r);
    Command* c=new ConctreteCommand(cc);
    Invoker i;
    i.setCommand(c);
    i.executeCommand();

}
