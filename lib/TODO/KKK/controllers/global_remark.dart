

///说明
///GlobalStateController 作为全局 控制器， 状态保存器，
///【1】对于不同业务应该独立一份mixin, 通过with  继承给GlobalStateController
///【2】避免GlobalStateController 单个类文件，过度臃肿，维护不方便；
///【3】如果过程中，模块之间需要到的数值状态有公用， 之间对改数据状态下沉 基础mixin, baseMixin 中