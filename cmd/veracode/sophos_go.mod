module sophoscentralbeat

go 1.12

// Automatic generated via repo: 'siem', file: 'WORKSPACE', override: 'sophos_override.json'

// Assume at repo top level (sophoscentralbeat directory) for 'go mod vendor' command
replace github.com/logrhythm/sophoscentralbeat/sophoscentral latest => ./sophoscentral
replace github.com/logrhythm/sophoscentralbeat latest => ./

require (
	github.com/logrhythm/sophoscentralbeat/sophoscentral latest // WS use above replace path
	github.com/logrhythm/sophoscentralbeat latest // WS use above replace path
	github.com/Sirupsen/logrus 1.0.2 // required not in WS
	github.com/golang/protobuf v1.3.0  // required not in WS

	  // similar to siem cmd/veracode/veracode_ws_go.mod file
	google.golang.org/grpc v1.22.0 // WS v1.22.0
	golang.org/x/net v0.0.0-20190311183353-d8887717615a // WS v0.0.0-20190311183353-d8887717615a
	golang.org/x/text v0.3.0 // WS v0.3.0
	github.com/bazelbuild/buildtools 6415663945d3248207da955aafa1fa2af1a0f2ed // WS 6415663945d3248207da955aafa1fa2af1a0f2ed
	github.com/atlassian/bazel-tools e0e575b8a809c4565ef189be871bb6b11cd91043 // WS e0e575b8a809c4565ef189be871bb6b11cd91043
	github.com/golang/mock 837231f7bb377b365da147e5ff6c031b12f0dfaa // WS 837231f7bb377b365da147e5ff6c031b12f0dfaa
	github.com/stretchr/testify 34c6fa2dc70986bccbbffcc6130f6920a924b075 // WS 34c6fa2dc70986bccbbffcc6130f6920a924b075
	github.com/pmezard/go-difflib v1.0.0 // WS v1.0.0.tar.gz
	github.com/davecgh/go-spew v1.1.0 // WS v1.1.0.tar.gz
	github.com/bluele/factory-go 2c901c30680a2faf8c29b8170954f89d8bb5dc75 // WS 2c901c30680a2faf8c29b8170954f89d8bb5dc75
	github.com/elastic/go-ucfg v0.5.1 // WS v0.5.1.tar.gz
	github.com/elastic/go-lumber 23fbfb3f47e548082d5287a2c106303b31504b17 // WS 23fbfb3f47e548082d5287a2c106303b31504b17
	github.com/klauspost/compress 30be6041bed523c18e269a700ebd9c2ea9328574 // WS 30be6041bed523c18e269a700ebd9c2ea9328574
	github.com/klauspost/cpuid 0da02118eaa37aa89aea6776b464a4ad00990af1 // WS 0da02118eaa37aa89aea6776b464a4ad00990af1
	github.com/natefinch/lumberjack latest // WS v2.1.tar.gz sophoscentralbeat build error
	github.com/go-yaml/yaml latest // WS v2.2.1.tar.gz sophoscentralbeat build error
	github.com/alexcesaro/statsd 7fea3f0d2fab1ad973e641e51dba45443a311a90 // WS 7fea3f0d2fab1ad973e641e51dba45443a311a90
	github.com/hashicorp/go-multierror 3d5d8f294aa03d8e98859feac328afbdf1ae0703 // WS 3d5d8f294aa03d8e98859feac328afbdf1ae0703.tar.gz
	github.com/hashicorp/errwrap d6c0cd88035724dd42e0f335ae30161c20575ecc // WS d6c0cd88035724dd42e0f335ae30161c20575ecc.tar.gz
	github.com/pkg/errors v0.8.0 // WS v0.8.0.tar.gz
	github.com/RackSec/srslog a4725f04ec91af1a91b380da679d6e0c2f061e59 // WS a4725f04ec91af1a91b380da679d6e0c2f061e59
	golang.org/x/sys 3249cb6984157e6ed574d535fb27fc72a94a67e2 // WS 3249cb6984157e6ed574d535fb27fc72a94a67e2
	github.com/fsnotify/fsnotify c2828203cd70a50dcccfb2761f8b1f8ceef9a8e9 // WS c2828203cd70a50dcccfb2761f8b1f8ceef9a8e9
	github.com/saintfish/chardet 3af4cd4741ca4f3eb0c407c034571a6fb0ea529c // WS 3af4cd4741ca4f3eb0c407c034571a6fb0ea529c
	github.com/jessevdk/go-flags v1.4.0 // WS v1.4.0.tar.gz
	cloud.google.com/go v0.34.0 // WS v0.34.0.tar.gz
	google.golang.org/api 94a01c17d1a38947febf7da60d4258f4d3f354e8 // WS 94a01c17d1a38947febf7da60d4258f4d3f354e8
	github.com/googleapis/gax-go ddfab93c3faef4935403ac75a7c11f0e731dc181 // WS ddfab93c3faef4935403ac75a7c11f0e731dc181
	go.opencensus.io 2f39cd45ab48b7dc7e5b0d7393bae371e201b1c4 // WS 2f39cd45ab48b7dc7e5b0d7393bae371e201b1c4
	golang.org/x/oauth2 5dab4167f31cbd76b407f1486c86b40748bc5073 // WS 5dab4167f31cbd76b407f1486c86b40748bc5073
	github.com/aws/aws-sdk-go 951ad7ef064805f1c666d02dee8dfe9363e0f014 // WS 951ad7ef064805f1c666d02dee8dfe9363e0f014
	github.com/dsnet/compress da652975a8eea9fa0735aba8056747a751db0bd3 // WS da652975a8eea9fa0735aba8056747a751db0bd3
	github.com/klauspost/pgzip 083b1c3f84dd6486588802e5ce295de3a7f41a8b // WS 083b1c3f84dd6486588802e5ce295de3a7f41a8b
	github.com/ulikunitz/xz 6f934d456d51e742b4eeab20d925a827ef22320a // WS 6f934d456d51e742b4eeab20d925a827ef22320a
	github.com/spf13/cobra 7547e83b2d85fd1893c7d76916f67689d761fecb // WS 7547e83b2d85fd1893c7d76916f67689d761fecb.tar.gz
	github.com/spf13/pflag 24fa6976df40757dce6aea913e7b81ade90530e1 // WS 24fa6976df40757dce6aea913e7b81ade90530e1.tar.gz
	github.com/spf13/viper 9e56dacc08fbbf8c9ee2dbc717553c758ce42bc9 // WS 9e56dacc08fbbf8c9ee2dbc717553c758ce42bc9
	github.com/spf13/cast 8c9545af88b134710ab1cd196795e7f2388358d7 // WS 8c9545af88b134710ab1cd196795e7f2388358d7
	github.com/pelletier/go-toml 65b27e6823c427415d156c92d7034dd57a154cf8 // WS 65b27e6823c427415d156c92d7034dd57a154cf8
	github.com/spf13/afero 588a75ec4f32903aa5e39a2619ba6a4631e28424 // WS 588a75ec4f32903aa5e39a2619ba6a4631e28424
	github.com/spf13/jwalterweatherman 94f6ae3ed3bceceafa716478c5fbf8d29ca601a1 // WS 94f6ae3ed3bceceafa716478c5fbf8d29ca601a1
	github.com/hashicorp/hcl 65a6292f0157eff210d03ed1bf6c59b190b8b906 // WS 65a6292f0157eff210d03ed1bf6c59b190b8b906
	github.com/magiconair/properties 7757cc9fdb852f7579b24170bcacda2c7471bb6a // WS 7757cc9fdb852f7579b24170bcacda2c7471bb6a
	github.com/tidwall/gjson fb8e539484c9fb2df9f472bc0e3949a74c256f95 // WS fb8e539484c9fb2df9f472bc0e3949a74c256f95
	github.com/tidwall/pretty 1166b9ac2b65e46a43d8618d30d1554f4652d49b // WS 1166b9ac2b65e46a43d8618d30d1554f4652d49b
	github.com/tidwall/match 33827db735fff6510490d69a8622612558a557ed // WS 33827db735fff6510490d69a8622612558a557ed
	github.com/elastic/beats v7.0.0 // WS 2c385a0764bdc537b6dc078a1d9bf11bb6d7bd95 is v6.6.0
	// github.com/elastic/beats v7.3.0 to v7.0.0 Solution 6.6.0 issue: cannot use adapter.GetGoMetric
	github.com/Azure/azure-event-hubs-go/v3 v3.1.1 // WS v3.1.1
	github.com/devigned/tab v0.1.1 // WS v0.1.1
	github.com/Azure/azure-amqp-common-go/v3 v3.0.0 // WS v3.0.0
	github.com/Azure/go-amqp v0.12.7 // WS v0.12.7
	github.com/Azure/azure-storage-blob-go 762620a866bab229a9e7aff8c44875c862cab322 // WS 762620a866bab229a9e7aff8c44875c862cab322
	github.com/Azure/go-autorest 20a15b4e99645bc30a1cf8de518a6e8ac331c864 // WS 20a15b4e99645bc30a1cf8de518a6e8ac331c864
	github.com/Azure/azure-sdk-for-go fa96a3744b0e40e6e0d3ddf985f80cfe2d51d6d6 // WS fa96a3744b0e40e6e0d3ddf985f80cfe2d51d6d6
	github.com/Azure/azure-pipeline-go 232aee85e8e3a6223a11c0943f7df2ae0fac00e4 // WS 232aee85e8e3a6223a11c0943f7df2ae0fac00e4
	github.com/mattn/go-ieproxy 6d733ce01d10a00b8e814f9f19189b721a6e5d85 // WS 6d733ce01d10a00b8e814f9f19189b721a6e5d85
	github.com/mitchellh/mapstructure 3536a929edddb9a5b34bd6861dc4a9647cb459fe // WS 3536a929edddb9a5b34bd6861dc4a9647cb459fe
	github.com/jpillora/backoff 8eab2debe79d12b7bd3d10653910df25fa9552ba // WS 8eab2debe79d12b7bd3d10653910df25fa9552ba
	github.com/dgrijalva/jwt-go 06ea1031745cb8b3dab3f6a236daf2b0aa468b7e // WS 06ea1031745cb8b3dab3f6a236daf2b0aa468b7e
	contrib.go.opencensus.io/exporter/ocagent 5a6e73f487e155ca74647bf2acdcf88e09133e2a // WS 5a6e73f487e155ca74647bf2acdcf88e09133e2a
	github.com/census-instrumentation/opencensus-proto 7f2434bc10da710debe5c4315ed6d4df454b4024 // WS 7f2434bc10da710debe5c4315ed6d4df454b4024
	golang.org/x/sync 37e7f081c4d4c64e13b10787722085407fe5d15f // WS 37e7f081c4d4c64e13b10787722085407fe5d15f
	golang.org/x/crypto a4c6cb3142f211c99e4bf4cd769535b29a9b616f // WS a4c6cb3142f211c99e4bf4cd769535b29a9b616f
	github.com/manifoldco/promptui d52ab0c3bdfe101f5d5a959862982c2f13fad6fb // WS d52ab0c3bdfe101f5d5a959862982c2f13fad6fb
	github.com/chzyer/readline 2972be24d48e78746da79ba8e24e8b488c9880de // WS 2972be24d48e78746da79ba8e24e8b488c9880de
	github.com/juju/ansiterm 720a0952cc2ac777afc295d9861263e2a4cf96a1 // WS 720a0952cc2ac777afc295d9861263e2a4cf96a1
	github.com/mattn/go-colorable 3a70a971f94a22f2fa562ffcc7a0eb45f5daf045 // WS 3a70a971f94a22f2fa562ffcc7a0eb45f5daf045
	github.com/mattn/go-isatty c2a7a6ca930a4cd0bc33a3f298eb71960732a3a7 // WS c2a7a6ca930a4cd0bc33a3f298eb71960732a3a7
	github.com/lunixbochs/vtclean 88cfb0c2efe8ed7b0ccf0af83db39359829027bb // WS 88cfb0c2efe8ed7b0ccf0af83db39359829027bb
	github.com/wayneashleyberry/terminal-dimensions ec888af5c0e52843a27fa3e3ebb93e8d5cfb3b9c // WS ec888af5c0e52843a27fa3e3ebb93e8d5cfb3b9c
	github.com/naoina/toml fb35166040e21557e387c099b33e97cadb837c9f // WS fb35166040e21557e387c099b33e97cadb837c9f
	github.com/naoina/go-stringutil 6b638e95a32d0c1131db0e7fe83775cbea4a0d0b // WS 6b638e95a32d0c1131db0e7fe83775cbea4a0d0b
	github.com/ghodss/yaml 25d852aebe32c875e9c044af3eef9c7dc6bc777f // WS 25d852aebe32c875e9c044af3eef9c7dc6bc777f
	gopkg.in/yaml.v2 51d6538a90f86fe93ac480b35f37b2be17fef232 // WS 51d6538a90f86fe93ac480b35f37b2be17fef232
	rsc.io/goversion 597212e462da05a7902d6cea0ec895a0d9b8b218 // WS 597212e462da05a7902d6cea0ec895a0d9b8b218
	github.com/pkg/profile acd64d450fd45fb2afa41f833f3788c8a7797219 // WS acd64d450fd45fb2afa41f833f3788c8a7797219
	github.com/json-iterator/go 7acbb404a45be33f136d6f16fe8f86ca30f1008d // WS 7acbb404a45be33f136d6f16fe8f86ca30f1008d
	github.com/modern-go/reflect2 4b7aa43c6742a2c18fdef89dd197aaae7dac7ccd // WS 4b7aa43c6742a2c18fdef89dd197aaae7dac7ccd
	github.com/modern-go/concurrent e0a39a4cb4216ea8db28e22a69f4ec25610d513a // WS e0a39a4cb4216ea8db28e22a69f4ec25610d513a
)
