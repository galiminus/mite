# Mite

Mite is an [Arthropod](https://github.com/victorgoya/arthropod) based Rack server. Let me try to explain:

- Arthropod is a small library that makes it easy to call remote Ruby code using Amazon SQS.
- Mite uses Arthropod to listen to SQS messages on a given and expects to get an Rack `env`.
- It will call your app with this env and respond to the Arthropod call with the usual status, headers and body.

It can probably be used to do pretty edgy stuff like building a remote Rack middleware, but I only use it in conjuction with Amazon Lambda to serve pages and API calls from Rails apps that happens to live behind a NAT and with a dynamic IP address allocation, because I do have tons of little pet projects that sometimes requires lots of CPU/lots of RAM/CUDA. Also, in those case I don't care much about latency (it's not horrible though, fast enough for pet projects).

## Installation

```
gem install mite
```

## Usage

Just run it with the required arguments.
```shell
$ mite -h

Usage: mite [options]
    -q, --queue [string]             SQS queue name
    -i, --access-key-id [string]     AWS access key ID, default to the AWS_ACCESS_KEY_ID environment variable
    -k, --secret-access-key [string] AWS secret access key, default to the AWS_SECRET_ACCESS_KEY environment variable
    -r, --region [string]            AWS region, default to the AWS_REGION environment variable
    -c, --config [string]            The path to your config.ru file
```

## Rails

It should works well with Rails, just call it with `mite -c ./config.ru` in your Rails root directory.

## Lambda

I usually use Amazon Lambda to push messages to SQS form an API Gateway resource. Take a look at [mite-lambda-proxy](https://github.com/victorgoya/mite-lambda-proxy) to see how you can setup something like that on your own.
