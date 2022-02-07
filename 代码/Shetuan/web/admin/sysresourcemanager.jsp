
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>系统资源管理</title>
    <link href="${pageContext.request.contextPath}/admin/css/web2table.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/webui/bootstrap-treeview/bootstrap-treeview.min.css" rel="stylesheet" />
    <script src="${pageContext.request.contextPath}/webui/bootstrap-treeview/bootstrap-treeview.min.js"></script>
    <script type="text/javascript">

        $(function () {
            var defaultData = [
                {
                    text: 'Parent 1',
                    href: '#parent1',
                    tags: ['4'],
                    nodes: [
                        {
                            text: 'Child 1',
                            href: '#child1',
                            tags: ['2'],
                            nodes: [
                                {
                                    text: '测试名字 <a class="btn btn-primary">测试1233</a>',
                                    href: '#grandchild1',
                                    tags: ['0']
                                },
                                {
                                    text: 'Grandchild 2',
                                    href: '#grandchild2',
                                    tags: ['0']
                                }
                            ]
                        },
                        {
                            text: 'Child 2',
                            href: '#child2',
                            tags: ['0']
                        }
                    ]
                },
                {
                    text: 'Parent 2',
                    href: '#parent2',
                    tags: ['0']
                },
                {
                    text: 'Parent 3',
                    href: '#parent3',
                    tags: ['0']
                },
                {
                    text: 'Parent 4',
                    href: '#parent4',
                    tags: ['0']
                },
                {
                    text: 'Parent 5',
                    href: '#parent5',
                    tags: ['0']
                }
            ];


            $("#treeview1").treeview({
                data: defaultData,
                showCheckbox:true
            });

        });

    </script>
</head>
<body>

<div class="btn-group">
    <button class="btn   btn-primary btn-group-sm">
        <span class="fa fa-plus"></span>
        添加根资源
    </button>
</div>
<div id="treeview1" class=""></div>

</body>
</html>
