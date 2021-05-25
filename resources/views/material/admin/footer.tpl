 <!-- js -->
 {if $config['sspanelAnalysis'] === true}
     <!-- Google Analytics -->
     <script>
         window.ga = window.ga || function() {
             (ga.q = ga.q || []).push(arguments)
         };
         ga.l = +new Date;
         ga('create', 'UA-111801619-3', 'auto');
         var hostDomain = window.location.host || document.location.host || document.domain;
         ga('set', 'dimension1', hostDomain);
         ga('send', 'pageview');
         (function() {
             function perfops() {
                 var js = document.createElement('script');
                 js.src = 'https://cdn.jsdelivr.net/npm/perfops-rom';
                 document.body.appendChild(js);
             }

             if (document.readyState === 'complete') {
                 perfops();
             } else {
                 window.addEventListener('load', perfops);
             }
         })();
     </script>
     <script async src="https://www.google-analytics.com/analytics.js"></script>
     <!-- End Google Analytics -->
 {/if}

<script src="/theme/material/js/base.min.js"></script>
<script src="/theme/material/js/project.min.js"></script>
<script>
</script>
 <script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.2"></script>
 <script src="https://cdn.jsdelivr.net/npm/datatables.net@2.1.1/js/jquery.dataTables.min.js"></script>
 <script src="/theme/material/admin/js/dataTables.bootstrap5.min.js"></script>
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous">
 </script>
 <script src="/theme/material/admin/js/admin.min.js"></script>


 </body>

 </html>
